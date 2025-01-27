import { Test, TestingModule } from '@nestjs/testing';
import { PayForService } from './pay_for.service';

describe('PayForService', () => {
  let service: PayForService;

  beforeEach(async () => {
    const module: TestingModule = await Test.createTestingModule({
      providers: [PayForService],
    }).compile();

    service = module.get<PayForService>(PayForService);
  });

  it('should be defined', () => {
    expect(service).toBeDefined();
  });
});
