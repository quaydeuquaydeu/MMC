-- create database
DROP DATABASE IF EXISTS Testing_System_DB;
CREATE DATABASE Testing_System_DB;
USE Testing_System_DB;


/* create Table 1: Department
●	DepartmentID: định danh của phòng ban (auto increment)
●	DepartmentName: tên đầy đủ của phòng ban (VD: sale, marketing, …)
*/
-- CREATE TABLE IF NOT EXISTS Department(
DROP TABLE IF EXISTS `Department`;
CREATE TABLE `Department`(
	DepartmentID 			TINYINT UNSIGNED AUTO_INCREMENT PRIMARY KEY,
    DepartmentName 			NVARCHAR(50)
);


/* Table 2: Position
●	PositionID: định danh của chức vụ (auto increment)
●	PositionName: tên chức vụ (Dev, Test, Scrum Master, PM)
*/
DROP TABLE IF EXISTS `Position`;
CREATE TABLE `Position`(
    PositionID       		 TINYINT UNSIGNED NOT NULL
    PositionName            ENUM('Dev', 'Test', 'Scrum Master', 'PM') NOT NULL UNIQUE
);
ALTER TABLE `Position` ADD CONSTRAINT pk_PositionID PRIMARY KEY(PositionID);

/* Table 3: Account
●	AccountID: định danh của User (auto increment)
●	Email:
●	Username:
●	FullName:
●	DepartmentID: phòng ban của user trong hệ thống
●	PositionID: chức vụ của User
●	CreateDate: ngày tạo tài khoản
*/
DROP TABLE IF EXISTS `Account`;
CREATE TABLE `Account`(
	AccountID				INT PRIMARY KEY,
    Email					VARCHAR(50),
    Username				VARCHAR(50),
    FullName				CHAR(50),
    DepartmentID 			INT,
    PositionID				INT,
    CreateDATE				DATE
);


/* Table 4: Group
●	GroupID: định danh của nhóm (auto increment)
●	GroupName: tên nhóm
●	CreatorID: id của người tạo group
●	CreateDate: ngày tạo group
*/
DROP TABLE IF EXISTS `Group`;
CREATE TABLE `Group`(
	GroupID					INT PRIMARY KEY,
    GroupName				VARCHAR(50),
    CreatorID				INT,
    CreateDATE				DATE
);


/* Table 5: GroupAccount
●	GroupID: định danh của nhóm
●	AccountID: định danh của User
●	JoinDate: Ngày user tham gia vào nhóm
*/
DROP TABLE IF EXISTS GroupAccount;
CREATE TABLE GroupAccount(
	GroupID					 INT UNSIGNED NOT NULL,
    AccountID				 INT UNSIGNED NOT NULL,
    JoinDATE				DATETIME DEFAULT NOW(),
    PRIMARY KEY(GroupID, AccountID)
);
ALTER TABLE `GroupAccount` ADD CONSTRAINT fk_GroupAccount_Group FOREIGN KEY(GroupID) REFERENCES 'Group'(GroupID);
ALTER TABLE `GroupAccount` ADD CONSTRAINT fk_GroupAccount_Account FOREIGN KEY(AccountID) REFERENCES 'Account'(AccountID);



/* Table 6: TypeQuestion
●	TypeID: định danh của loại câu hỏi (auto increment)
●	TypeName: tên của loại câu hỏi (Essay, Multiple-Choice)
*/
DROP TABLE IF EXISTS TypeQuestion;
CREATE TABLE TypeQuestion (
    TypeID 		INT,
    TypeName 	VARCHAR(50)
);


/* Table 7: CategoryQuestion
●	CategoryID: định danh của chủ đề câu hỏi (auto increment)
●	CategoryName: tên của chủ đề câu hỏi (Java, .NET, SQL, Postman, Ruby,…)
*/
DROP TABLE IF EXISTS CategoryQuestion;
CREATE TABLE CategoryQuestion(
    CategoryID				INT,
    CategoryName			VARCHAR(50) 
);


/* Table 8: Question
●	QuestionID: định danh của câu hỏi (auto increment)
●	Content: nội dung của câu hỏi
●	CategoryID: định danh của chủ đề câu hỏi
●	TypeID: định danh của loại câu hỏi
●	CreatorID: id của người tạo câu hỏi
●	CreateDate: ngày tạo câu hỏi
*/
DROP TABLE IF EXISTS Question;
CREATE TABLE Question(
    QuestionID				INT PRIMARY KEY.
    Content					VARCHAR(50) ,
    CategoryID				INT,
    TypeID					INT,
    CreatorID				INT,
    CreateDATE				DATE
);


/* Table 9: Answer
●	AnswerID: định danh của câu trả lời (auto increment)
●	Content: nội dung của câu trả lời
●	QuestionID: định danh của câu hỏi
●	isCorrect: câu trả lời này đúng hay sai
*/
DROP TABLE IF EXISTS Answer;
CREATE TABLE Answer(
    Answers					TINYINT UNSIGNED PRIMARY KEY NOT NULL,
    Content					VARCHAR(50),
    QuestionID				INT,
    isCorrect				BIT,
    FOREIGN KEY(QuestionID) REFERENCES Question(QuestionID)
);


/* Table 10: Exam
●	ExamID: định danh của đề thi (auto increment)
●	Code: mã đề thi
●	Title: tiêu đề của đề thi
●	CategoryID: định danh của chủ đề thi
●	Duration: thời gian thi
●	CreatorID: id của người tạo đề thi
●	CreateDate: ngày tạo đề thi
*/
DROP TABLE IF EXISTS Exam;
CREATE TABLE Exam(
    ExamID					TINYINT UNSIGNED PRIMARY KEY NOT NULL,
    Code					VARCHAR(10),
    Title					VARCHAR(50),
    CategoryID				INT,
    Duration				INT,
    CreatorID				INT,
    CreateDATE				DATE
);


/* Table 11: ExamQuestion
●	ExamID: định danh của đề thi
●	QuestionID: định danh của câu hỏi
*/
DROP TABLE IF EXISTS ExamQuestion;
CREATE TABLE ExamQuestion(
    ExamID				TINYINT UNSIGNED PRIMARY KEY NOT NULL,
	QuestionID			TINYINT UNSIGNED NOT NULL
);