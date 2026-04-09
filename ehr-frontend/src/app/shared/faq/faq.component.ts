import { Component } from '@angular/core';
import { CommonModule } from '@angular/common';
import { FilterPipe } from '../filer.pipe';
import { FormsModule } from '@angular/forms';

@Component({
  selector: 'app-faq',
  standalone: true,
  imports: [CommonModule, FilterPipe, FormsModule],
  templateUrl: './faq.component.html',
  styleUrls: ['./faq.component.css']
})
export class FaqComponent {

  openIndex: number | null = null;
  searchText: string = '';
  role = localStorage.getItem('role') || 'patient';

  toggle(i: number) {
    this.openIndex = this.openIndex === i ? null : i;
  }

  faqs = [

{
q: "What is the main purpose of this EHR system?",
a: "The primary purpose of this Electronic Health Record (EHR) system is to digitize and centralize patient information in a structured and accessible format. Instead of relying on manual paperwork, the system enables healthcare professionals to retrieve and update patient data instantly. It improves coordination between departments, reduces redundancy, and minimizes human errors. Additionally, it ensures better tracking of patient history, diagnoses, and treatments over time, ultimately enhancing the quality of care delivered."
},

{
q: "Why did you choose Angular and Spring Boot?",
a: "Angular was chosen because it provides a component-based architecture that promotes modularity and reusability of UI elements. It also supports two-way data binding, making dynamic updates seamless. Spring Boot was selected for backend development due to its simplicity, rapid development capabilities, and strong support for REST APIs. It integrates well with relational databases and ensures scalable backend architecture. Together, they create a powerful full-stack solution suitable for real-world enterprise applications."
},

{
q: "How is data stored in your system?",
a: "Data in the system is stored in a relational database where entities such as patient, encounter, prescriptions, diagnoses, and vitals are organized into separate tables. These tables are connected using primary and foreign keys to maintain relationships. Normalization techniques are applied to eliminate redundancy and ensure data consistency. Backend APIs interact with the database using structured queries, allowing efficient retrieval and updates of complex medical data."
},

{
q: "How does authentication work?",
a: "Authentication in the system is handled using user credentials such as username and password stored securely in the database. When a user logs in, the system verifies these credentials and determines the user’s role. Based on this role, the user is redirected to their respective dashboard. Although currently basic authentication is implemented, it can be extended using JWT tokens or OAuth for enhanced security and session management."
},

{
q: "What is role-based access control?",
a: "Role-based access control (RBAC) ensures that each user interacts only with features relevant to their responsibilities. For example, doctors can view diagnoses and prescribe medications, nurses can update patient vitals, and administrators can manage system-level data. This separation enhances both security and usability by preventing unauthorized access and reducing interface complexity for each role."
},

{
q: "How do different dashboards work?",
a: "Each dashboard is dynamically rendered based on the user’s role stored in local storage after login. The frontend loads specific components and layouts tailored to that role. At the same time, backend APIs are also designed to return role-specific data. This ensures that users only see relevant information, improving both performance and user experience."
},

{
q: "How do you handle patient details retrieval?",
a: "Patient details are retrieved using backend APIs that perform complex SQL joins across multiple tables such as encounters, diagnoses, prescriptions, and vitals. This allows the system to present a unified view of the patient’s medical history. Efficient querying ensures minimal latency while fetching comprehensive data."
},

{
q: "What are encounters in your system?",
a: "Encounters represent individual interactions between a patient and the healthcare system. These can be OPD visits, hospital admissions (IPD), or emergency cases. Each encounter acts as a central link connecting diagnoses, prescriptions, and vitals recorded during that visit. This structure helps maintain a chronological medical history for each patient."
},

{
q: "How is data consistency maintained?",
a: "Data consistency is maintained through proper database design using foreign key constraints and normalized tables. Transactions ensure that operations either complete fully or not at all, preventing partial updates. Backend validations also help maintain integrity before any data is stored."
},

{
q: "What challenges did you face?",
a: "One of the major challenges was managing complex joins across multiple related tables while maintaining performance. Another challenge was synchronizing frontend UI with backend data structures, especially when dealing with nested or dynamic data. Debugging API errors and ensuring proper data mapping between layers also required careful attention."
},

{
q: "How does your system handle multiple prescriptions for a patient?",
a: "The system stores prescriptions in a separate table linked via encounter_id and mpid. This allows multiple prescriptions per patient across different visits. When retrieving data, joins are used to fetch relevant prescriptions. In advanced implementations, aggregation or filtering can be applied to show only the latest or most relevant prescriptions."
},

{
q: "Why did you use SQL joins instead of multiple API calls?",
a: "Using SQL joins reduces the number of API calls and ensures that related data is fetched in a single query. This improves performance and consistency. It also reduces frontend complexity since the backend returns a structured dataset instead of requiring multiple requests."
},

{
q: "What is the importance of encounter_id in your schema?",
a: "Encounter_id acts as a linking key between different clinical records such as diagnoses, prescriptions, and vitals. It ensures that all data related to a specific visit is grouped together, making it easier to track patient history accurately."
},

{
q: "How would you improve performance for large datasets?",
a: "Performance can be improved by indexing frequently queried columns, optimizing SQL queries, and using pagination. Caching mechanisms like Redis can also be introduced. Additionally, lazy loading on the frontend can reduce initial load time."
},

{
q: "How do you ensure scalability of your system?",
a: "Scalability can be achieved by adopting microservices architecture, deploying the system on cloud platforms, and using load balancers. Database scaling techniques like sharding and replication can also be implemented."
},

{
q: "What happens if the database fails?",
a: "In case of database failure, backup and recovery mechanisms should be in place. Regular backups ensure data safety, and failover strategies can help switch to a backup database with minimal downtime."
},

{
q: "How can you implement real-time monitoring?",
a: "Real-time monitoring can be implemented using WebSockets or server-sent events. This allows the server to push updates instantly to the frontend, which is useful for live vitals tracking and alerts."
},

{
q: "What design pattern is used in your backend?",
a: "The backend follows a layered architecture similar to MVC, where controllers handle requests, services contain business logic, and repositories manage database interactions. This separation improves maintainability and scalability."
},

{
q: "How would you secure this system further?",
a: "Security can be enhanced by implementing JWT authentication, encrypting sensitive data, using HTTPS, and applying role-based authorization at API level. Logging and monitoring can also help detect suspicious activities."
},

{
q: "How does your system handle concurrent users?",
a: "The system handles multiple users through stateless REST APIs. Database transactions and proper indexing ensure that concurrent operations do not lead to conflicts. In future, connection pooling and distributed systems can further improve concurrency handling."
},

{
q: "How does your system handle multiple prescriptions for a patient?",
a: "The system stores prescriptions in a separate table linked via encounter_id and mpid. This allows multiple prescriptions per patient across different visits. When retrieving data, joins are used to fetch relevant prescriptions. In advanced implementations, aggregation or filtering can be applied to show only the latest or most relevant prescriptions."
},

{
q: "Why did you use SQL joins instead of multiple API calls?",
a: "Using SQL joins reduces the number of API calls and ensures that related data is fetched in a single query. This improves performance and consistency. It also reduces frontend complexity since the backend returns a structured dataset instead of requiring multiple requests."
},

{
q: "What is the importance of encounter_id in your schema?",
a: "Encounter_id acts as a linking key between different clinical records such as diagnoses, prescriptions, and vitals. It ensures that all data related to a specific visit is grouped together, making it easier to track patient history accurately."
},

{
q: "How would you improve performance for large datasets?",
a: "Performance can be improved by indexing frequently queried columns, optimizing SQL queries, and using pagination. Caching mechanisms like Redis can also be introduced. Additionally, lazy loading on the frontend can reduce initial load time."
},

{
q: "How do you ensure scalability of your system?",
a: "Scalability can be achieved by adopting microservices architecture, deploying the system on cloud platforms, and using load balancers. Database scaling techniques like sharding and replication can also be implemented."
},

{
q: "What happens if the database fails?",
a: "In case of database failure, backup and recovery mechanisms should be in place. Regular backups ensure data safety, and failover strategies can help switch to a backup database with minimal downtime."
},

{
q: "How can you implement real-time monitoring?",
a: "Real-time monitoring can be implemented using WebSockets or server-sent events. This allows the server to push updates instantly to the frontend, which is useful for live vitals tracking and alerts."
},

{
q: "What design pattern is used in your backend?",
a: "The backend follows a layered architecture similar to MVC, where controllers handle requests, services contain business logic, and repositories manage database interactions. This separation improves maintainability and scalability."
},

{
q: "How would you secure this system further?",
a: "Security can be enhanced by implementing JWT authentication, encrypting sensitive data, using HTTPS, and applying role-based authorization at API level. Logging and monitoring can also help detect suspicious activities."
},

{
q: "How does your system handle concurrent users?",
a: "The system handles multiple users through stateless REST APIs. Database transactions and proper indexing ensure that concurrent operations do not lead to conflicts. In future, connection pooling and distributed systems can further improve concurrency handling."
},

{
q: "How do you handle null values in joins?",
a: "Since we are using LEFT JOINs, some fields may return null when related data is missing. To handle this, we ensure proper null checks in both backend and frontend. In SQL, functions like COALESCE can be used to provide default values. On the UI side, conditional rendering ensures that null values do not break the layout."
},

{
q: "Why did you choose LEFT JOIN instead of INNER JOIN?",
a: "LEFT JOIN ensures that even if related data like prescriptions or vitals is missing, the patient record is still returned. INNER JOIN would exclude such records, which is not desirable in healthcare systems where incomplete data should still be visible."
},

{
q: "How do you avoid duplicate records due to joins?",
a: "Duplicates can occur when multiple related records exist, such as multiple prescriptions for one encounter. To handle this, we use techniques like DISTINCT, GROUP BY, or LIMIT clauses depending on the requirement. Alternatively, backend logic can filter or map only the latest records."
},

{
q: "What is the difference between encounter-based and patient-based data fetching?",
a: "Patient-based fetching retrieves overall patient information, while encounter-based fetching focuses on a specific visit. Encounter-based design is more precise as it groups diagnosis, prescriptions, and vitals for a particular interaction, making data more structured and meaningful."
},

{
q: "How does your system maintain modularity in frontend?",
a: "The frontend is built using Angular components, where each feature like dashboard, FAQ, team, and forms is separated into reusable components. This improves maintainability, allows independent development, and makes debugging easier."
},

{
q: "What are the risks of using native SQL queries?",
a: "Native queries provide flexibility but come with risks such as database dependency, harder maintenance, and potential SQL injection if not handled properly. Using parameterized queries helps mitigate security risks."
},

{
q: "How do you ensure API reliability?",
a: "API reliability is ensured through proper error handling, validation, and consistent response formats. Backend services catch exceptions and return meaningful error messages. Frontend also handles failures gracefully to avoid crashes."
},

{
q: "What is normalization level used in your database?",
a: "The database design follows normalization principles close to 3NF (Third Normal Form). This ensures that data is structured efficiently without redundancy and that dependencies are properly maintained."
},

{
q: "How would you handle audit logs in this system?",
a: "Audit logs can be implemented by recording actions such as login, updates, and prescriptions into a separate table. Each log would include user ID, action performed, timestamp, and affected data. This improves traceability and accountability."
},

{
q: "What happens if multiple users update the same patient record?",
a: "This can lead to concurrency issues. To handle this, techniques like optimistic locking or version control can be used. Transactions also ensure that updates are atomic and consistent."
}];


}