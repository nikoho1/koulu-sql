# Tietokannan kuvaus

Tämä tietokanta sisältää tietoa opettajista, oppilaista, luokista, ilmoittautumisista ja arvosanoista. Seuraavat taulut on luotu:

- Teachers: Sisältää opettajien tiedot
- Students: Sisältää oppilaiden tiedot
- Classes: Sisältää luokkien tiedot
- Enrollments: Liittää oppilaat luokkiin
- Grades: Tallentaa oppilaiden saamia arvosanoja eri aineista

## Esimerkkejä SELECT-kyselyistä

### 1. Kaikki oppilaat ja heidän syntymävuotensa

```sql
SELECT name, birth_year FROM Students;
```

### 2. Kaikki luokat ja niihin ilmoittautuneet oppilaat

```sql
SELECT c.class_name, s.name
FROM Enrollments e
JOIN Students s ON e.student_id = s.student_id
JOIN Classes c ON e.class_id = c.class_id;
```

### 3. Oppilaan arvosanat ja opettajat

```sql
SELECT s.name AS student_name, t.name AS teacher_name, g.subject, g.grade, g.graded_at
FROM Grades g
JOIN Students s ON g.student_id = s.student_id
LEFT JOIN Teachers t ON g.teacher_id = t.teacher_id;
```

### 4. Opettajan antamat arvosanat

```sql
SELECT t.name AS teacher_name, g.subject, g.grade, s.name AS student_name
FROM Grades g
JOIN Teachers t ON g.teacher_id = t.teacher_id
JOIN Students s ON g.student_id = s.student_id
WHERE t.name = 'Sara Hämäläinen';
```

### 5. Oppilaan keskiarvo

```sql
SELECT s.name AS student_name, AVG(g.grade) AS average_grade
FROM Grades g
JOIN Students s ON g.student_id = s.student_id
WHERE s.name = 'Elias Niemi'
GROUP BY s.name;
```
