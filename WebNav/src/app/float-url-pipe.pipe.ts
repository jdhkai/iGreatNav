import { Pipe, PipeTransform } from '@angular/core';

@Pipe({
  name: 'floatUrlPipe'
})
export class FloatUrlPipePipe implements PipeTransform {

  transform(value: any, ...args: any[]): any {
    var floatUrl = [];
    value.forEach(item => {
      if(item.level === args[0]){
        floatUrl.push(item);
      }
    });
    return floatUrl;
  }

}
