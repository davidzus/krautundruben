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
                `-- Enter Rezept ID 
SET @v_Rez_ID = ???;

DELETE FROM Rezepte WHERE Rez_ID = @v_Rez_ID;
DELETE FROM Rez_Ctg WHERE Rez_ID = @v_Rez_ID;
DELETE FROM Rez_Zutat WHERE Rez_ID = @v_Rez_ID;`;

        } else if (e.target.name == "Add") {
            sqlStatementsTextarea.value = `INSERT INTO Rezepte (Feld_Namen,??,??) VALUES (?, ?)`
        } else if (e.target.name == "Update") {
            sqlStatementsTextarea.value = `UPDATE Rezepte SET Rezepte.Feld_Name = ??? WHERE Rezepte.Feld_Name = ???`
        } else if (e.target.name == "Select") {
            sqlStatementsTextarea.value = `SELECT * FROM Rezepte`;
        } else if (e.target.name == "ChooseNotUsed") {
            sqlStatementsTextarea.value = `SELECT Zutat.Zutat_ID, Zutat.* FROM Zutat 
LEFT JOIN Rez_Zutat ON Rez_Zutat.Zutat_ID = Zutat.Zutat_ID 
WHERE Rez_Zutat.Zutat_ID IS null;`
        } else if (e.target.name == "ChooseNeverSold") {
            sqlStatementsTextarea.value = `SELECT Rezepte.Rez_ID, Rezepte.* FROM Rezepte 
LEFT JOIN Bes_Rez ON Bes_Rez.Rez_ID = Rezepte.Rez_ID
WHERE Bes_Rez.Rez_ID IS null;`
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