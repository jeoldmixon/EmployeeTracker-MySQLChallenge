// mySQL
const mysql = require("mysql2");
//Inquirer
const inquirer = require('inquirer');
// Console Table
const consoleTable = require("console.table");
//Artsy file for word art
const logo = require("asciiart-logo");
//JSON file
const config = require("./package.json");

// -- Use secondary "root user" = justin // pw justin1 so "real" pw isn't on github
// https://phoenixnap.com/kb/how-to-create-new-mysql-user-account-grant-privileges

// https://www.youtube.com/watch?v=9ylj9NR0Lcg
const connection = mysql.createConnection({
    host: 'localhost',
    //default port for mysql 3306 -- same in lessons
    // https://dev.mysql.com/doc/mysql-port-reference/en/mysql-ports-reference-tables.html#:~:text=Port%203306%20is%20the%20default,such%20as%20mysqldump%20and%20mysqlpump.
    port: 3306,
    user: 'justin',
    password: 'justin1',
    database: 'employeeDatabase'
});
connection.connect((err => {
    if (err) throw err;
    console.log("Shh...They're listening")
}));

console.log(logo(config).render());
// Below is the example for to show other "words"
// console.log(logo({ name: "Employee's" }).render());

const employeeDatabaseQuestions = async () => {
  const response = await inquirer
    .prompt([
      {
        type: "list",
        name: "select",
        message: "Choose from below",
        choices: [
          "View Departments",
          "View Roles",
          "View Employees",
          "Add Department",
          "Add Employee",
          "Change Employee Role",
          "QUIT",
        ],
      },
    ]);
  switch (response.select) {
    case "View Departments":
      viewDepartments();
      break;
    case "View Roles":
      viewRoles();
      break;
    case "View Employees":
      viewEmployees();
      break;
    case "Add Department":
      addDepartment();
      break;
    case "Add Employee":
      addEmployee();
      break;
    case "Change Employee Role":
      changeRole();
      break;
    default:
      quit();
  }
};
quit = () => {
  console.log(logo({ name: "Good Bye for now" }).render());
  return process.exit();
};

const viewDepartments = () => {
  console.log(logo({ name: "ALL DEPARTMENTS" }).render());
  connection.query("SELECT * FROM department ORDER BY name DESC;", function (
    err,
    res
  ) {
    if (err) throw err;
    console.table(res);
  });
  employeeDatabaseQuestions();
};

const viewRoles = () => {
  console.log(logo({ name: "All Roles" }).render());
  connection.query(
    "SELECT roles.id, title, salary, department.name AS department FROM roles LEFT JOIN department ON roles.department_id = department.id;",
    

    function (err, res) {
      if (err) throw err;
      console.table(res);
      employeeDatabaseQuestions();
    }
  );
  
};
const viewEmployees = () => {
  console.log(logo({ name: "All Employees" }).render());
  connection.query(
    //THANKS JOSH & PHIL
    "SELECT emp.id, emp.first_name, emp.last_name, r.title, d.name AS department, r.salary,CONCAT (m.last_name, ', ', m.first_name) AS manager FROM employee AS emp INNER JOIN roles AS r ON emp.role_id = r.id INNER JOIN department AS d ON r.department_id = d.id LEFT JOIN employee AS m ON emp.manager_id = m.id ORDER BY emp.id;",
    function (err, res) {
      if (err) throw err;
      console.table(res);
      employeeDatabaseQuestions();
    }
  );
  
};

const addDepartment = async () => {
  const responsed = await inquirer
    .prompt([
      {
        type: "input",
        name: "newDepartment",
        message: "Type the name of the department you want to add: ",
      },
    ]);
  const response = connection.query(
    `INSERT INTO departments SET ?`,
    { dept_name: response.newDepartment },
    function (err, res) {
      if (err)
        throw err;
      viewDepartments();
      employeeDatabaseQuestions();
    }
  );
};

const addEmployee = () => {
  return inquirer.prompt([
    {
      type: "input",
      name: "first_name",
      message: "Enter employee first name?",
    },
    {
      type: "input",
      name: "last_name",
      message: "Enter employee last name",
    },
    {
      type: "list",
      name: "role_id",
      choices: 
      [
        "Paramedic", 
        "EMT"
      ],
    },
]).then((newEmployee) => {
    const { first_name, last_name, role_id } = newEmployee
     
  })

};


// const response = connection.query(
//   `INSERT INTO employee (first_name,last_name,role_id)`,
//   function (err, res) {
//     if (err)
//       throw err;
//     viewEmployees();
//   }
// );


employeeDatabaseQuestions();