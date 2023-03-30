http://10.0.0.1:5050/api/auth/login/
{
  "username": "string",
  "password": "string"
}

http://10.0.0.1:5050/api/tasks/?include_config=true

http://10.0.0.1:5050/api/variables/

http://10.0.0.1:5050/api/server/config/

http://10.0.0.1:5050/api/schedules/

http://10.0.0.1:5050/api/status/?include_execution=true&sort_by=last_execution_time&order=desc&per_page=50&page=1

http://10.0.0.1:5050/api/history/?task=task-m&sort_by=time&order=desc&per_page=50&page=1

http://10.0.0.1:5050/api/series/?begin=false&latest=true&page=1&per_page=50&order=desc&sort_by=show_name&in_config=configured

http://10.0.0.1:5050/api/pending_list/

http://10.0.0.1:5050/api/pending_list/1/entries/?sort_by=title&order=desc&per_page=50&page=1

http://10.0.0.1:5050/api/entry_list/

http://10.0.0.1:5050/api/entry_list/1/entries/?page=1&per_page=50&order=desc&sort_by=title

http://10.0.0.1:5050/api/movie_list/

http://10.0.0.1:5050/api/movie_list/1/movies/?page=1&per_page=50&order=desc&sort_by=title

http://10.0.0.1:5050/api/failed/?page=1&per_page=50&order=desc&sort_by=failure_time
