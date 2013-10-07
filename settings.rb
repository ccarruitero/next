File.read("env.sh").scan(/(.*?)="?(.*)"?$/).each { |key, value| ENV[key] ||= value }
