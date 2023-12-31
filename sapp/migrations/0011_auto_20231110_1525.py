# Generated by Django 3.2.21 on 2023-11-10 09:55

from django.db import migrations, models
import django.db.models.deletion


class Migration(migrations.Migration):

    dependencies = [
        ('sapp', '0010_remove_booking_table_nohours'),
    ]

    operations = [
        migrations.AlterField(
            model_name='rating_table',
            name='rate',
            field=models.FloatField(),
        ),
        migrations.CreateModel(
            name='roomalocation_table',
            fields=[
                ('id', models.BigAutoField(auto_created=True, primary_key=True, serialize=False, verbose_name='ID')),
                ('date', models.DateField()),
                ('BOOKING', models.ForeignKey(on_delete=django.db.models.deletion.CASCADE, to='sapp.booking_table')),
                ('ROOM', models.ForeignKey(on_delete=django.db.models.deletion.CASCADE, to='sapp.room_table')),
            ],
        ),
    ]
