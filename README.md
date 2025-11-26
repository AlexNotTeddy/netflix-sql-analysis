

```markdown
# 📘 Netflix Data Analysis Using SQL

Analisi completa del dataset Netflix tramite MySQL: creazione database, import dati, pulizia e oltre 15 query avanzate (CTE, window functions, parsing stringhe, classificazione testuale, ranking e cumulative totals).

Il progetto riproduce il flusso di lavoro tipico di un Data Engineer:  
dataset grezzo → import → cleaning → analisi SQL → documentazione finale.

```

---

## 🎯 Obiettivi

* Analizzare il dataset ufficiale Netflix tramite MySQL.
* Effettuare data wrangling con SQL puro.
* Applicare strategie avanzate: CTE, Window Functions, REGEXP, parsing stringhe.

---

## 🛠️ Tecniche e strumenti

* MySQL 8.0 (CTE, Window Functions, STR_TO_DATE, SUBSTRING, REGEXP, CAST, SUM() OVER, PERCENT_RANK())  
* Parsing stringhe con SUBSTRING, LEFT, RIGHT, SUBSTRING_INDEX  
* Classificazione testuale tramite REGEXP  
* Pulizia dati e import CSV con LOAD DATA INFILE  

---

## 📂 Struttura del repository

```

netflix-project-using-sql/
├─ Data/
│  └─ netflix_titles.csv
├─ Images/
│  └─ Interfaccia_di_lavoro.png
├─ SQL/
│  ├─ 01_Netflix_Create_table&Import.sql
│  ├─ 02_Netflix_Queries.sql
│  └─ 03_Netflix_sideSheet.sql
└─ README.md

```

---

## 🧾 SQL Files

### [01_Netflix_Create_table&Import.sql](./SQL/01_Netflix_Create_table&Import.sql)
* Creazione database `netflix_db` e tabella `netflix`
* Import CSV con LOAD DATA INFILE

### [02_Netflix_Queries.sql](./SQL/02_Netflix_Queries.sql)
* Analisi Movies vs TV Shows
* Rating più comune
* Film per anno
* Percentili durata film per rating
* Longest movie
* Cumulative count per anno
* Classificazione contenuti Violent/Romantic/Other
* Altre query avanzate

### [03_Netflix_sideSheet.sql](./SQL/03_Netflix_sideSheet.sql)
* Foglio operativo con test intermedi, parsing stringhe e REGEXP

---

## 🖼️ Screenshot

![MySQL Workbench](./Images/Interfaccia_di_lavoro.png)

---

## 📥 Dataset

[Netflix_titles.csv](./Data/netflix_titles.csv)

---

## 🎓 Cosa ho imparato

* Import e qualità dati con LOAD DATA INFILE
* Parsing e normalizzazione valori numerici
* Uso pratico di CTE e Window Functions
* Classificazione e analisi testi con REGEXP
* Troubleshooting errori import e path

---

## 📎 Contatti

**LinkedIn:** [https://www.linkedin.com/in/fokou-alex-679014212/](https://www.linkedin.com/in/fokou-alex-679014212/)  
**Email:** [teddyalex.fokou@mail.polimi.it](mailto:teddyalex.fokou-alex.polimi.it)
