action = ARGV.first.strip.downcase
list   = ARGV.last.strip.downcase

require_relative list
subtrees_dir = 'SUBTREES'
subtrees = SUBTREES.each_slice(3)

if action == 'add'
  subtrees.each do |item|
    local_path  = item[0]
    remote_repo = item[1]
    branch      = item[2]

    puts `
      git subtree add \
        --prefix #{subtrees_dir}/#{local_path} \
        #{remote_repo} \
        #{branch} --squash
    `
  end
elsif action == 'push'
  subtrees.each do |item|
    local_path  = item[0]
    remote_repo = item[1]
    branch      = item[2]

    puts `
      git subtree push \
        --prefix #{subtrees_dir}/#{local_path} \
        #{remote_repo} \
        #{branch}
    `
  end
elsif action == 'pull'
  subtrees.each do |item|
    local_path  = item[0]
    remote_repo = item[1]
    branch      = item[2]

    puts `
      git subtree pull \
        --prefix #{subtrees_dir}/#{local_path} \
        #{remote_repo} \
        #{branch}
    `
  end
else
  puts 'Undefined action. Acceptable values: [ add | push | pull ]'
end
