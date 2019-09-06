import { TestBed } from '@angular/core/testing';

import { APIServiceService } from './apiservice.service';

describe('APIServiceService', () => {
  beforeEach(() => TestBed.configureTestingModule({}));

  it('should be created', () => {
    const service: APIServiceService = TestBed.get(APIServiceService);
    expect(service).toBeTruthy();
  });
});
