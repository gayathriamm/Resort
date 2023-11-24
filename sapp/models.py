from django.db import models

# Create your models here.
class login_table(models.Model):
    username=models.CharField(max_length=90)
    password=models.CharField(max_length=90)
    type=models.CharField(max_length=90)

class user_table(models.Model):
    username = models.CharField(max_length=90)
    image = models.FileField()
    phone = models.BigIntegerField()
    place = models.CharField(max_length=90)
    post = models.CharField(max_length=90)
    pin = models.IntegerField()
    email = models.CharField(max_length=90)
    LOGIN=models.ForeignKey(login_table,on_delete=models.CASCADE)

class resort_table(models.Model):
    resortname=models.CharField(max_length=90)
    place=models.CharField(max_length=90)
    image=models.FileField()
    post=models.CharField(max_length=90)
    pin=models.IntegerField()
    lattitude=models.FloatField()
    longitude=models.FloatField()
    email=models.CharField(max_length=90)
    phone=models.BigIntegerField()
    LOGIN=models.ForeignKey(login_table,on_delete=models.CASCADE)

class rating_table(models.Model):
    rate=models.FloatField()
    feedback = models.CharField(max_length=90)
    date=models.DateField()
    USER = models.ForeignKey(user_table, on_delete=models.CASCADE)
    RESORT = models.ForeignKey(resort_table, on_delete=models.CASCADE)

class complaint_table(models.Model):
    compaint=models.CharField(max_length=500)
    date=models.DateField()
    reply=models.CharField(max_length=500)
    USER = models.ForeignKey(user_table, on_delete=models.CASCADE)

class facilities_table(models.Model):
    image=models.FileField()
    facilities=models.TextField()
    RESORT = models.ForeignKey(resort_table, on_delete=models.CASCADE)

class room_table(models.Model):
    status=models.CharField(max_length=90)
    image=models.FileField()
    roomno=models.CharField(max_length=90)
    type=models.CharField(max_length=90)
    rate=models.FloatField()
    RESORT = models.ForeignKey(resort_table, on_delete=models.CASCADE)

class booking_table(models.Model):
    status=models.CharField(max_length=90)
    date=models.DateField()
    RESORT = models.ForeignKey(resort_table, on_delete=models.CASCADE)
    USER = models.ForeignKey(user_table, on_delete=models.CASCADE)

class payment_table(models.Model):
     time=models.TimeField()
     payment=models.FloatField()
     date=models.DateField()
     BOOKING = models.ForeignKey(booking_table, on_delete=models.CASCADE)



class roomalocation_table(models.Model):
     BOOKING = models.ForeignKey(booking_table, on_delete=models.CASCADE)
     ROOM = models.ForeignKey(room_table, on_delete=models.CASCADE)
     date = models.DateField()


class chat_table(models.Model):
    fromid = models.ForeignKey(login_table,on_delete=models.CASCADE,related_name='fromid')
    toid = models.ForeignKey(login_table,on_delete=models.CASCADE,related_name='toid')
    message=models.CharField(max_length=90)
    date=models.DateField()









