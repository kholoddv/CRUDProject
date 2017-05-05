CREATE SCHEMA `test` DEFAULT CHARACTER SET utf8 COLLATE utf8_general_ci ;

CREATE  TABLE `test`.`users` (
  `id` INT(8) NOT NULL AUTO_INCREMENT ,
  `name` VARCHAR(25) NOT NULL ,
  `age` INT NOT NULL ,
  `isAdmin` BIT NOT NULL ,
  `createdDate` TIMESTAMP NOT NULL ,
  PRIMARY KEY (`id`) );

INSERT INTO `test`.`users` (`name`, `age`, `isAdmin`) VALUES ('Jacob', '20', 1);
INSERT INTO `test`.`users` (`name`, `age`, `isAdmin`) VALUES ('Emily', '21', 0);
INSERT INTO `test`.`users` (`name`, `age`, `isAdmin`) VALUES ('Michael', '22', 0);
INSERT INTO `test`.`users` (`name`, `age`, `isAdmin`) VALUES ('Emma', '23', 0);
INSERT INTO `test`.`users` (`name`, `age`, `isAdmin`) VALUES ('David', '24', 0);
INSERT INTO `test`.`users` (`name`, `age`, `isAdmin`) VALUES ('Sarah', '25', 1);
INSERT INTO `test`.`users` (`name`, `age`, `isAdmin`) VALUES ('Jack', '26', 0);
INSERT INTO `test`.`users` (`name`, `age`, `isAdmin`) VALUES ('Nicole', '27', 0);
INSERT INTO `test`.`users` (`name`, `age`, `isAdmin`) VALUES ('John', '28', 0);
INSERT INTO `test`.`users` (`name`, `age`, `isAdmin`) VALUES ('Vanessa', '29', 0);
INSERT INTO `test`.`users` (`name`, `age`, `isAdmin`) VALUES ('John', '30', 1);
INSERT INTO `test`.`users` (`name`, `age`, `isAdmin`) VALUES ('Emily', '31', 0);
INSERT INTO `test`.`users` (`name`, `age`, `isAdmin`) VALUES ('John', '32', 0);
INSERT INTO `test`.`users` (`name`, `age`, `isAdmin`) VALUES ('Sarah', '33', 0);
INSERT INTO `test`.`users` (`name`, `age`, `isAdmin`) VALUES ('Jack', '34', 0);
