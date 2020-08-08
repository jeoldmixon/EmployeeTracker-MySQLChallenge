const express = require('express');
const mysql = require('mysql2');
const server = require('../EmployeeTracker-MySQLChallenge/lib/server');
const logo = require('asciiart-logo');
const config = require('./package.json');

console.log(logo(config).render());
// Below is the example for to show other "words"
// console.log(logo({ name: "Employee's" }).render());

//Find All Employees

//Create Employee

//Remove Employee