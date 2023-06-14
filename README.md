# Vet Clinic Database


# 📗 Table of Contents

- [📖 About the Project](#about-project)
  - [🛠 Built With](#built-with)
    - [Tech Stack](#tech-stack)
    - [Key Features](#key-features)
  - [🚀 Live Demo](#live-demo)
- [💻 Getting Started](#getting-started)
  - [Setup](#setup)
  - [Prerequisites](#prerequisites)
  - [Install](#install)
  - [Usage](#usage)
  - [Run tests](#run-tests)
  - [Deployment](#triangular_flag_on_post-deployment)
- [👥 Authors](#authors)
- [🔭 Future Features](#future-features)
- [🤝 Contributing](#contributing)
- [⭐️ Show your support](#support)
- [🙏 Acknowledgements](#acknowledgements)
- [❓ FAQ](#faq)
- [📝 License](#license)


# 📖 Vet Clinic Database <a name="about-project"></a>


**Vet Clinic Database** is a relational database based on postgreSQL for a vetinary clinic. It has four tables which are; animals, animals' owners, clinic employees, and visits. 

## 🛠 Built With <a name="built-with"></a>

### Tech Stack <a name="tech-stack"></a>

<details>
<summary>Database</summary>
  <ul>
    <li><a href="https://www.postgresql.org/">PostgreSQL</a></li>
  </ul>
</details>


### Key Features <a name="key-features"></a>

- **Animals table** This database features the animals table which consists of the id, name, date_of_birth, escape_attempts, weight, neutered as its columns


<p align="right">(<a href="#readme-top">back to top</a>)</p>


## 🚀 Live Demo <a name="live-demo"></a>

- [Live Demo Link]('#')

<p align="right">(<a href="#readme-top">back to top</a>)</p>


## 💻 Getting Started <a name="getting-started"></a>

To get a local copy up and running, follow these steps.

### Prerequisites

In order to run this project you need:

 <ul>
    <li>Install postgreSQL onto your local machine</li>
 </ul>

### Setup

Clone this repository to your desired folder:

```sh
  cd my-folder
  git clone git@github.com:Adams-Ghub/vet-clinic-database.git
```

### Install

Install this project by observing the following;
<ul>
<li>
open the SQLshell or pgAdmin4 application
</li>
<li>
Create a database (vet_clinic) by running the following command in the Query editor

```sh
  CREATE DATABASE vet_clinic
``` 
</li>
<li>
Run the command in the schema.sql file to create a table called animals
</li>
<li>
Run the commands in the data.sql file to populate the database
</li>

</ul>


### Usage

To run the project, execute the following command in your terminal

```sh
  psql -U postgres  
```
then provide your password to access the database

### Run tests

To check the databases available in the server after accessing it run the following command

```sh
  \l  
```

To access a database run the following command

```sh
  \c 'database_name'
```


### Deployment

You can only run this project on your local machine


<p align="right">(<a href="#readme-top">back to top</a>)</p>


## 👥 Authors <a name="authors"></a>

👤 **Adams Bamfo**

- GitHub: [Adams-Ghub](https://github.com/Adams-Ghub)
- Twitter: [@bamfoaf](https://twitter.com/bamfoaf)
- LinkedIn: [Adams Bamfo](https://www.linkedin.com/in/adams-bamfo/)


<p align="right">(<a href="#readme-top">back to top</a>)</p>

## 🔭 Future Features <a name="future-features"></a>

- [ ] **Animals' owners table**

<p align="right">(<a href="#readme-top">back to top</a>)</p>


## 🤝 Contributing <a name="contributing"></a>

Contributions, issues, and feature requests are welcome!

Feel free to check the [issues page](../../issues/).

<p align="right">(<a href="#readme-top">back to top</a>)</p>

## ⭐️ Show your support <a name="support"></a>

If you like this project share it with others

<p align="right">(<a href="#readme-top">back to top</a>)</p>


## 🙏 Acknowledgments <a name="acknowledgements"></a>

I would like to thank Microverse for providing reviewers who ensure that the best of this project was obtained

<p align="right">(<a href="#readme-top">back to top</a>)</p>


## ❓ FAQ <a name="faq"></a>

- **How do I run SQL queries in the command line**

  - Run the usual SQL queries and ensure you terminate with "\g"

- **How do I access a table in a database in the command line**

  - Run the command "\d table_name"

<p align="right">(<a href="#readme-top">back to top</a>)</p>


## 📝 License <a name="license"></a>

This project is [MIT](./LICENSE) licensed.

<p align="right">(<a href="#readme-top">back to top</a>)</p>
