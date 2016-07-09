cd /var/local
sudo mkdir -p ctm
sudo chown `whoami`:root ctm
virtualenv --python=python3 ctm
cd ctm
./bin/pip install -r  https://raw.githubusercontent.com/ta5ae/ctm-deploy/master/requirements.txt
source ./bin/activate
mkdir -p src
cd src
wagtail start check_the_map
cd check_the_map
python manage.py migrate
python manage.py createsuperuser
python manage.py runserver