# Generated by Django 3.2.20 on 2023-11-06 16:49

from django.db import migrations, models


class Migration(migrations.Migration):

    dependencies = [
        ('sapp', '0001_initial'),
    ]

    operations = [
        migrations.AddField(
            model_name='rating_table',
            name='feedback',
            field=models.CharField(default='exit', max_length=90),
            preserve_default=False,
        ),
    ]