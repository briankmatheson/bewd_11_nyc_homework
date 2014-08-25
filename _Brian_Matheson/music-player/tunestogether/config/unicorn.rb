# Set the working application directory
# working_directory "/path/to/your/app"
working_directory "/home/bmath/tunestogether/"

# Unicorn PID file location
pid "/tmp/unicorn.pid"

# Path to logs
# stderr_path "/path/to/log/unicorn.log"
# stdout_path "/path/to/log/unicorn.log"
stderr_path "/tmp/unicorn-error.log"
stdout_path "/tmp/unicorn.log"

# Unicorn socket
listen "/tmp/unicorn.tunestogether.sock"

# Number of processes
# worker_processes 4
worker_processes 3

# Time-out
timeout 300

