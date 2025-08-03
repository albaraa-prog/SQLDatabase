# Company Database – ER Diagram Design

![Company ER Diagram](https://github.com/user-attachments/assets/3b8cbf7f-cadf-4e04-99ae-52aa96f08454)

---

## **Entities & Attributes**

### **1. Employee**
- **SSN** (Primary Key)  
- Fname  
- Lname  
- BirthDate  
- Gender  

**Relationships:**  
- Belongs to **one Department**  
- May **supervise** other employees (recursive relationship)  
- May have **Dependents** (if employed)  
- Works on multiple **Projects** (with WorkingHours recorded)  

---

### **2. Department**
- **DNUM** (Primary Key)  
- DName  
- Locations (**Multivalued**)  

**Relationships:**  
- **Managed by one Employee** (Management relationship with `HireDate`)  
- Has multiple **Employees**  
- Owns multiple **Projects**  

---

### **3. Project**
- **PNumber** (Primary Key)  
- PName  
- Location  
- City  

**Relationships:**  
- Belongs to **one Department**  
- Has multiple **Employees** working on it (via Works_On, with `WorkingHours`)  

---

### **4. Dependent**
- **DependentName** (Primary Key under Employee)  
- Gender  
- BirthDate  

**Relationships:**  
- Belongs to **one Employee**  
- **Existence dependent** on Employee (deleted when employee leaves)  

---

## **Relationships & Constraints**
1. **Employee – Department**  
   - **One-to-Many**: Each employee is assigned to one department.  
   - A department can have multiple employees.  

2. **Employee – Employee (Supervision)**  
   - **Recursive Relationship**: An employee may supervise other employees.  

3. **Employee – Project (Works_On)**  
   - **Many-to-Many**: Employees can work on multiple projects.  
   - **WorkingHours** is an attribute of this relationship.  

4. **Department – Project**  
   - **One-to-Many**: Each project belongs to one department.  
   - A department can have multiple projects.  

5. **Department – Employee (Management)**  
   - **One-to-One**: A department is managed by one employee.  
   - **HireDate** is an attribute of this relationship.  

6. **Employee – Dependent**  
   - **One-to-Many**: An employee can have multiple dependents.  
   - Dependents are removed if the employee is deleted.  

---

## **Special Notes**
- **Keys**:  
  - Primary keys: `SSN`, `DNUM`, `PNumber`, `DependentName (per Employee)`  
- **Multivalued attributes**:  
  - Department `Locations`  
- **Weak entity**:  
  - `Dependent` is a **weak entity** dependent on Employee.  

---

**Author:** _[Al Baraa Al Harthi]_  
**Purpose:** ER Diagram documentation for company database design.
