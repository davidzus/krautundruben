const DeleteStatementBtn = document.querySelector(".add_statement_btn[name=Delete]");
const AddStatementBtn = document.querySelector(".add_statement_btn[name=Add]");
const UpdateStatementBtn = document.querySelector(".add_statement_btn[name=Update]");
const SelectStatementBtn = document.querySelector(".add_statement_btn[name=Select]");
const ChooseNotUsedStatementBtn = document.querySelector(".add_statement_btn[name=ChooseNotUsed]");
const ChooseNeverSold = document.querySelector(".add_statement_btn[name=ChooseNeverSold]");

const controlBtns = document.querySelectorAll(".add_statement_btn");
const sqlStatementsTextarea = document.querySelector(".sql_statements");

controlBtns.forEach((btn) => {
    btn.addEventListener("click", (e) => {
        if (e.target.name == "Delete") {
            sqlStatementsTextarea.value =
                `-- Enter Zutat ID 
SET @v_Zutat_ID = ???;

DELETE FROM Zutat WHERE Zutat_ID = @v_Zutat_ID;
DELETE FROM Zez_Zutat WHERE Zutat_ID = @v_Zutat_ID;
DELETE FROM Naehrstoffangaben WHERE Zutat_ID = @v_Zutat_ID;
DELETE FROM Zutat_Allerg WHERE Zutat_ID = @v_Zutat_ID;
DELETE FROM Zutat_Lief WHERE Zutat_ID = @v_Zutat_ID;
DELETE FROM Kohlenhydrate WHERE Zutat_ID = @v_Zutat_ID;
DELETE FROM Fett WHERE Zutat_ID = @v_Zutat_ID;`;

        } else if (e.target.name == "Add") {
            sqlStatementsTextarea.value = `INSERT INTO Zutat (Feld_Namen,??,??) VALUES (?, ?)`
        } else if (e.target.name == "Update") {
            sqlStatementsTextarea.value = `UPDATE Zutat SET Zutat.Feld_Name = ??? WHERE Zutat.Feld_Name = ???`
        } else if (e.target.name == "Select") {
            sqlStatementsTextarea.value = `SELECT * FROM Zutat`;
        } else if (e.target.name == "ChooseNotUsed") {
            sqlStatementsTextarea.value = `SELECT Zutat.Zutat_ID, Zutat.* FROM Zutat 
LEFT JOIN Rez_Zutat ON Rez_Zutat.Zutat_ID = Zutat.Zutat_ID 
WHERE Rez_Zutat.Zutat_ID IS null;`
        } else if (e.target.name == "ChooseNeverSold") {
            sqlStatementsTextarea.value = `SELECT Zutat.Zutat_ID, Zutat.* FROM Zutat 
LEFT JOIN Bes_Zutat ON Bes_Zutat.Zutat_ID = Zutat.Zutat_ID
WHERE Bes_Zutat.Zutat_ID IS null;`
        }
    });
})



//Params Function
loadSqlStatement();
function loadSqlStatement(){
    const params = new URLSearchParams(window.location.search);
    params.forEach((value,key) => {
        sqlStatementsTextarea.value = value;
});
}