
# AWS Hosting Cost Estimation (EU-West-1)

## EC2 Instance Comparison (Monthly, On-Demand, 24/7)

| Instance Type | vCPU | RAM   | Monthly Cost (USD) |
|---------------|------|-------|---------------------|
| t2.micro      | 1    | 1 GB  | ~$6.28              |
| t2.small      | 1    | 2 GB  | ~$12.56             |
| t2.medium     | 2    | 4 GB  | ~$33.41             |
| t3.micro      | 2    | 1 GB  | ~$6.47              |
| t3.small      | 2    | 2 GB  | ~$12.94             |
| t3.medium     | 2    | 4 GB  | ~$25.92             |

**Note:** t3 instances offer better performance and pricing than t2 but rely on CPU credits.

---

## Static Website Hosting (S3)

- **Users/day**: ~10
- **Monthly visits**: ~300
- **Storage**: 100 MB (~0.1 GB)
- **Data Transfer**: ~300 MB

| Resource             | Cost (USD)     |
|----------------------|----------------|
| S3 Storage           | ~$0.0023       |
| S3 Requests          | ~$0            |
| Data Transfer        | ~$0            |
| **Total (S3)**       | **~$0.00**     |

---

## Main Setup Estimation (t2.medium)

| Resource         | Cost (USD)     |
|------------------|----------------|
| EC2 Instance     | ~$33.41        |
| EBS Volume (30GB gp3) | ~$2.40    |
| EBS Snapshot (1x Full) | ~$1.50    |
| S3 Hosting       | ~$0.00         |
| **Total**        | **~$37.31**    |

---
