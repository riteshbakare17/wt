from django.db import models

class Student(models.Model):
    name = models.CharField(max_length=100)
    roll_no = models.IntegerField()
    department = models.CharField(max_length=50)
    marks = models.IntegerField()

    def __str__(self):
        return f"{self.name} ({self.roll_no})"
