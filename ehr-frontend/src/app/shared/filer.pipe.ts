import { Pipe, PipeTransform } from '@angular/core';

@Pipe({
  name: 'filter',
  standalone: true
})
export class FilterPipe implements PipeTransform {
  transform(items: any[], search: string): any[] {
    if (!items || !search) return items;

    search = search.toLowerCase();

    return items.filter(item =>
      item.q.toLowerCase().includes(search) ||
      item.a.toLowerCase().includes(search)
    );
  }
}