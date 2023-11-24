# Generated by Django 3.2.20 on 2023-11-06 23:00

from django.db import migrations, models
import django.db.models.deletion


class Migration(migrations.Migration):

    dependencies = [
        ('sapp', '0002_rating_table_feedback'),
    ]

    operations = [
        migrations.CreateModel(
            name='chat_table',
            fields=[
                ('id', models.BigAutoField(auto_created=True, primary_key=True, serialize=False, verbose_name='ID')),
                ('message', models.CharField(max_length=90)),
                ('date', models.DateField()),
                ('fromid', models.ForeignKey(on_delete=django.db.models.deletion.CASCADE, related_name='fromid', to='sapp.login_table')),
                ('toid', models.ForeignKey(on_delete=django.db.models.deletion.CASCADE, related_name='toid', to='sapp.login_table')),
            ],
        ),
    ]