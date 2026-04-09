import { Component } from '@angular/core';
import { CommonModule } from '@angular/common';

@Component({
  selector: 'app-faq',
  standalone: true,
  imports: [CommonModule],
  templateUrl: './faq.component.html',
  styleUrls: ['./faq.component.css']
})
export class FaqComponent {

  openIndex = -1;

  toggle(i: number) {
    this.openIndex = this.openIndex === i ? -1 : i;
  }

  faqs = [
    { q: 'What is an EHR system?', a: 'It is a digital version of patient medical records accessible in real time.' },
    { q: 'Difference between EHR and EMR?', a: 'EMR is limited to one organization, while EHR is shareable across systems.' },
    { q: 'Why did you choose Angular?', a: 'Angular provides modular architecture, scalability, and strong component-based design.' },
    { q: 'What is role-based access?', a: 'Different users get different views and permissions based on their roles.' },
    { q: 'How is data stored?', a: 'Data is stored in structured relational database tables.' },
    { q: 'How does frontend communicate with backend?', a: 'Through REST APIs using HTTP calls.' },
    { q: 'What is REST API?', a: 'A standard way for systems to communicate using HTTP methods.' },
    { q: 'How is data security handled?', a: 'Authentication and role-based authorization ensure controlled access.' },
    { q: 'What challenges did you face?', a: 'Maintaining consistency across dashboards and integrating multiple modules.' },
    { q: 'What is modular architecture?', a: 'Breaking system into reusable and independent components.' },
    { q: 'How does your dashboard update dynamically?', a: 'Using asynchronous API calls and Angular data binding.' },
    { q: 'What is scalability?', a: 'Ability of system to handle increasing users and data.' },
    { q: 'How can this system scale?', a: 'By using microservices, load balancing, and cloud deployment.' },
    { q: 'What is normalization in DB?', a: 'Organizing data to reduce redundancy.' },
    { q: 'Explain lazy loading', a: 'Loading modules only when needed to improve performance.' },
    { q: 'How is performance optimized?', a: 'Efficient API calls, modular UI, and optimized rendering.' },
    { q: 'What is state management?', a: 'Managing application data flow between components.' },
    { q: 'How will you handle large hospital data?', a: 'Using indexing, caching, and scalable backend architecture.' },
    { q: 'Future improvements?', a: 'AI-based diagnosis, analytics dashboards, mobile support.' },
    { q: 'Why is this project important?', a: 'It solves real-world healthcare data management problems.' }
  ];
}