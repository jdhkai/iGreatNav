import { TestBed } from '@angular/core/testing';

import { BannerHttpServiceService } from './banner-http-service.service';

describe('BannerHttpServiceService', () => {
  beforeEach(() => TestBed.configureTestingModule({}));

  it('should be created', () => {
    const service: BannerHttpServiceService = TestBed.get(BannerHttpServiceService);
    expect(service).toBeTruthy();
  });
});
