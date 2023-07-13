# frozen_string_literal: true

require 'rails_helper'

RSpec.describe UsersController, type: :controller do
  before do
    stub_request(:get, 'https://api.github.com/users/rails/repos')
      .with(
        headers: {
          'Accept' => '*/*',
          'Accept-Encoding' => 'gzip;q=1.0,deflate;q=0.6,identity;q=0.3',
          'User-Agent' => 'Ruby'
        }
      )
      .to_return(status: 200, body: '', headers: {})
  end
  let(:user) { User.create(username: 'rails') }
  let(:repo_json) do
    [{ "id": 665_446_755,
       "node_id": 'R_kgDOJ6npYw',
       "name": 'github-scrapper',
       "full_name": 'kapilpdev/github-scrapper',
       "private": false,
       "owner":
       { "login": 'kapilpdev',
         "id": 132_426_154,
         "node_id": 'U_kgDOB-Spqg',
         "avatar_url": 'https://avatars.githubusercontent.com/u/132426154?v=4',
         "gravatar_id": '',
         "url": 'https://api.github.com/users/kapilpdev',
         "html_url": 'https://github.com/kapilpdev',
         "followers_url": 'https://api.github.com/users/kapilpdev/followers',
         "following_url": 'https://api.github.com/users/kapilpdev/following{/other_user}',
         "gists_url": 'https://api.github.com/users/kapilpdev/gists{/gist_id}',
         "starred_url": 'https://api.github.com/users/kapilpdev/starred{/owner}{/repo}',
         "subscriptions_url": 'https://api.github.com/users/kapilpdev/subscriptions',
         "organizations_url": 'https://api.github.com/users/kapilpdev/orgs',
         "repos_url": 'https://api.github.com/users/kapilpdev/repos',
         "events_url": 'https://api.github.com/users/kapilpdev/events{/privacy}',
         "received_events_url": 'https://api.github.com/users/kapilpdev/received_events',
         "type": 'User',
         "site_admin": false },
       "html_url": 'https://github.com/kapilpdev/github-scrapper',
       "description": nil,
       "fork": false,
       "url": 'https://api.github.com/repos/kapilpdev/github-scrapper',
       "forks_url": 'https://api.github.com/repos/kapilpdev/github-scrapper/forks',
       "keys_url": 'https://api.github.com/repos/kapilpdev/github-scrapper/keys{/key_id}',
       "collaborators_url": 'https://api.github.com/repos/kapilpdev/github-scrapper/collaborators{/collaborator}',
       "teams_url": 'https://api.github.com/repos/kapilpdev/github-scrapper/teams',
       "hooks_url": 'https://api.github.com/repos/kapilpdev/github-scrapper/hooks',
       "issue_events_url": 'https://api.github.com/repos/kapilpdev/github-scrapper/issues/events{/number}',
       "events_url": 'https://api.github.com/repos/kapilpdev/github-scrapper/events',
       "assignees_url": 'https://api.github.com/repos/kapilpdev/github-scrapper/assignees{/user}',
       "branches_url": 'https://api.github.com/repos/kapilpdev/github-scrapper/branches{/branch}',
       "tags_url": 'https://api.github.com/repos/kapilpdev/github-scrapper/tags',
       "blobs_url": 'https://api.github.com/repos/kapilpdev/github-scrapper/git/blobs{/sha}',
       "git_tags_url": 'https://api.github.com/repos/kapilpdev/github-scrapper/git/tags{/sha}',
       "git_refs_url": 'https://api.github.com/repos/kapilpdev/github-scrapper/git/refs{/sha}',
       "trees_url": 'https://api.github.com/repos/kapilpdev/github-scrapper/git/trees{/sha}',
       "statuses_url": 'https://api.github.com/repos/kapilpdev/github-scrapper/statuses/{sha}',
       "languages_url": 'https://api.github.com/repos/kapilpdev/github-scrapper/languages',
       "stargazers_url": 'https://api.github.com/repos/kapilpdev/github-scrapper/stargazers',
       "contributors_url": 'https://api.github.com/repos/kapilpdev/github-scrapper/contributors',
       "subscribers_url": 'https://api.github.com/repos/kapilpdev/github-scrapper/subscribers',
       "subscription_url": 'https://api.github.com/repos/kapilpdev/github-scrapper/subscription',
       "commits_url": 'https://api.github.com/repos/kapilpdev/github-scrapper/commits{/sha}',
       "git_commits_url": 'https://api.github.com/repos/kapilpdev/github-scrapper/git/commits{/sha}',
       "comments_url": 'https://api.github.com/repos/kapilpdev/github-scrapper/comments{/number}',
       "issue_comment_url": 'https://api.github.com/repos/kapilpdev/github-scrapper/issues/comments{/number}',
       "contents_url": 'https://api.github.com/repos/kapilpdev/github-scrapper/contents/{+path}',
       "compare_url": 'https://api.github.com/repos/kapilpdev/github-scrapper/compare/{base}...{head}',
       "merges_url": 'https://api.github.com/repos/kapilpdev/github-scrapper/merges',
       "archive_url": 'https://api.github.com/repos/kapilpdev/github-scrapper/{archive_format}{/ref}',
       "downloads_url": 'https://api.github.com/repos/kapilpdev/github-scrapper/downloads',
       "issues_url": 'https://api.github.com/repos/kapilpdev/github-scrapper/issues{/number}',
       "pulls_url": 'https://api.github.com/repos/kapilpdev/github-scrapper/pulls{/number}',
       "milestones_url": 'https://api.github.com/repos/kapilpdev/github-scrapper/milestones{/number}',
       "notifications_url": 'https://api.github.com/repos/kapilpdev/github-scrapper/notifications{?since,all,participating}',
       "labels_url": 'https://api.github.com/repos/kapilpdev/github-scrapper/labels{/name}',
       "releases_url": 'https://api.github.com/repos/kapilpdev/github-scrapper/releases{/id}',
       "deployments_url": 'https://api.github.com/repos/kapilpdev/github-scrapper/deployments',
       "created_at": '2023-07-12T08:16:00Z',
       "updated_at": '2023-07-12T08:17:51Z',
       "pushed_at": '2023-07-13T08:43:21Z',
       "git_url": 'git://github.com/kapilpdev/github-scrapper.git',
       "ssh_url": 'git@github.com:kapilpdev/github-scrapper.git',
       "clone_url": 'https://github.com/kapilpdev/github-scrapper.git',
       "svn_url": 'https://github.com/kapilpdev/github-scrapper',
       "homepage": nil,
       "size": 70,
       "stargazers_count": 0,
       "watchers_count": 0,
       "language": 'Ruby',
       "has_issues": true,
       "has_projects": true,
       "has_downloads": true,
       "has_wiki": true,
       "has_pages": false,
       "has_discussions": false,
       "forks_count": 0,
       "mirror_url": nil,
       "archived": false,
       "disabled": false,
       "open_issues_count": 0,
       "license": nil,
       "allow_forking": true,
       "is_template": false,
       "web_commit_signoff_required": false,
       "topics": [],
       "visibility": 'public',
       "forks": 0,
       "open_issues": 0,
       "watchers": 0,
       "default_branch": 'main' },
     { "id": 636_033_900,
       "node_id": 'R_kgDOJekbbA',
       "name": 'loyalty-program',
       "full_name": 'kapilpdev/loyalty-program',
       "private": false,
       "owner":
       { "login": 'kapilpdev',
         "id": 132_426_154,
         "node_id": 'U_kgDOB-Spqg',
         "avatar_url": 'https://avatars.githubusercontent.com/u/132426154?v=4',
         "gravatar_id": '',
         "url": 'https://api.github.com/users/kapilpdev',
         "html_url": 'https://github.com/kapilpdev',
         "followers_url": 'https://api.github.com/users/kapilpdev/followers',
         "following_url": 'https://api.github.com/users/kapilpdev/following{/other_user}',
         "gists_url": 'https://api.github.com/users/kapilpdev/gists{/gist_id}',
         "starred_url": 'https://api.github.com/users/kapilpdev/starred{/owner}{/repo}',
         "subscriptions_url": 'https://api.github.com/users/kapilpdev/subscriptions',
         "organizations_url": 'https://api.github.com/users/kapilpdev/orgs',
         "repos_url": 'https://api.github.com/users/kapilpdev/repos',
         "events_url": 'https://api.github.com/users/kapilpdev/events{/privacy}',
         "received_events_url": 'https://api.github.com/users/kapilpdev/received_events',
         "type": 'User',
         "site_admin": false },
       "html_url": 'https://github.com/kapilpdev/loyalty-program',
       "description": nil,
       "fork": false,
       "url": 'https://api.github.com/repos/kapilpdev/loyalty-program',
       "forks_url": 'https://api.github.com/repos/kapilpdev/loyalty-program/forks',
       "keys_url": 'https://api.github.com/repos/kapilpdev/loyalty-program/keys{/key_id}',
       "collaborators_url": 'https://api.github.com/repos/kapilpdev/loyalty-program/collaborators{/collaborator}',
       "teams_url": 'https://api.github.com/repos/kapilpdev/loyalty-program/teams',
       "hooks_url": 'https://api.github.com/repos/kapilpdev/loyalty-program/hooks',
       "issue_events_url": 'https://api.github.com/repos/kapilpdev/loyalty-program/issues/events{/number}',
       "events_url": 'https://api.github.com/repos/kapilpdev/loyalty-program/events',
       "assignees_url": 'https://api.github.com/repos/kapilpdev/loyalty-program/assignees{/user}',
       "branches_url": 'https://api.github.com/repos/kapilpdev/loyalty-program/branches{/branch}',
       "tags_url": 'https://api.github.com/repos/kapilpdev/loyalty-program/tags',
       "blobs_url": 'https://api.github.com/repos/kapilpdev/loyalty-program/git/blobs{/sha}',
       "git_tags_url": 'https://api.github.com/repos/kapilpdev/loyalty-program/git/tags{/sha}',
       "git_refs_url": 'https://api.github.com/repos/kapilpdev/loyalty-program/git/refs{/sha}',
       "trees_url": 'https://api.github.com/repos/kapilpdev/loyalty-program/git/trees{/sha}',
       "statuses_url": 'https://api.github.com/repos/kapilpdev/loyalty-program/statuses/{sha}',
       "languages_url": 'https://api.github.com/repos/kapilpdev/loyalty-program/languages',
       "stargazers_url": 'https://api.github.com/repos/kapilpdev/loyalty-program/stargazers',
       "contributors_url": 'https://api.github.com/repos/kapilpdev/loyalty-program/contributors',
       "subscribers_url": 'https://api.github.com/repos/kapilpdev/loyalty-program/subscribers',
       "subscription_url": 'https://api.github.com/repos/kapilpdev/loyalty-program/subscription',
       "commits_url": 'https://api.github.com/repos/kapilpdev/loyalty-program/commits{/sha}',
       "git_commits_url": 'https://api.github.com/repos/kapilpdev/loyalty-program/git/commits{/sha}',
       "comments_url": 'https://api.github.com/repos/kapilpdev/loyalty-program/comments{/number}',
       "issue_comment_url": 'https://api.github.com/repos/kapilpdev/loyalty-program/issues/comments{/number}',
       "contents_url": 'https://api.github.com/repos/kapilpdev/loyalty-program/contents/{+path}',
       "compare_url": 'https://api.github.com/repos/kapilpdev/loyalty-program/compare/{base}...{head}',
       "merges_url": 'https://api.github.com/repos/kapilpdev/loyalty-program/merges',
       "archive_url": 'https://api.github.com/repos/kapilpdev/loyalty-program/{archive_format}{/ref}',
       "downloads_url": 'https://api.github.com/repos/kapilpdev/loyalty-program/downloads',
       "issues_url": 'https://api.github.com/repos/kapilpdev/loyalty-program/issues{/number}',
       "pulls_url": 'https://api.github.com/repos/kapilpdev/loyalty-program/pulls{/number}',
       "milestones_url": 'https://api.github.com/repos/kapilpdev/loyalty-program/milestones{/number}',
       "notifications_url": 'https://api.github.com/repos/kapilpdev/loyalty-program/notifications{?since,all,participating}',
       "labels_url": 'https://api.github.com/repos/kapilpdev/loyalty-program/labels{/name}',
       "releases_url": 'https://api.github.com/repos/kapilpdev/loyalty-program/releases{/id}',
       "deployments_url": 'https://api.github.com/repos/kapilpdev/loyalty-program/deployments',
       "created_at": '2023-05-04T01:48:47Z',
       "updated_at": '2023-05-04T01:56:59Z',
       "pushed_at": '2023-05-04T01:56:52Z',
       "git_url": 'git://github.com/kapilpdev/loyalty-program.git',
       "ssh_url": 'git@github.com:kapilpdev/loyalty-program.git',
       "clone_url": 'https://github.com/kapilpdev/loyalty-program.git',
       "svn_url": 'https://github.com/kapilpdev/loyalty-program',
       "homepage": nil,
       "size": 63,
       "stargazers_count": 0,
       "watchers_count": 0,
       "language": 'Ruby',
       "has_issues": true,
       "has_projects": true,
       "has_downloads": true,
       "has_wiki": true,
       "has_pages": false,
       "has_discussions": false,
       "forks_count": 0,
       "mirror_url": nil,
       "archived": false,
       "disabled": false,
       "open_issues_count": 0,
       "license": nil,
       "allow_forking": true,
       "is_template": false,
       "web_commit_signoff_required": false,
       "topics": [],
       "visibility": 'public',
       "forks": 0,
       "open_issues": 0,
       "watchers": 0,
       "default_branch": 'main' },
     { "id": 636_027_492,
       "node_id": 'R_kgDOJekCZA',
       "name": 'rails',
       "full_name": 'kapilpdev/rails',
       "private": false,
       "owner":
       { "login": 'kapilpdev',
         "id": 132_426_154,
         "node_id": 'U_kgDOB-Spqg',
         "avatar_url": 'https://avatars.githubusercontent.com/u/132426154?v=4',
         "gravatar_id": '',
         "url": 'https://api.github.com/users/kapilpdev',
         "html_url": 'https://github.com/kapilpdev',
         "followers_url": 'https://api.github.com/users/kapilpdev/followers',
         "following_url": 'https://api.github.com/users/kapilpdev/following{/other_user}',
         "gists_url": 'https://api.github.com/users/kapilpdev/gists{/gist_id}',
         "starred_url": 'https://api.github.com/users/kapilpdev/starred{/owner}{/repo}',
         "subscriptions_url": 'https://api.github.com/users/kapilpdev/subscriptions',
         "organizations_url": 'https://api.github.com/users/kapilpdev/orgs',
         "repos_url": 'https://api.github.com/users/kapilpdev/repos',
         "events_url": 'https://api.github.com/users/kapilpdev/events{/privacy}',
         "received_events_url": 'https://api.github.com/users/kapilpdev/received_events',
         "type": 'User',
         "site_admin": false },
       "html_url": 'https://github.com/kapilpdev/rails',
       "description": 'Ruby on Rails',
       "fork": true,
       "url": 'https://api.github.com/repos/kapilpdev/rails',
       "forks_url": 'https://api.github.com/repos/kapilpdev/rails/forks',
       "keys_url": 'https://api.github.com/repos/kapilpdev/rails/keys{/key_id}',
       "collaborators_url": 'https://api.github.com/repos/kapilpdev/rails/collaborators{/collaborator}',
       "teams_url": 'https://api.github.com/repos/kapilpdev/rails/teams',
       "hooks_url": 'https://api.github.com/repos/kapilpdev/rails/hooks',
       "issue_events_url": 'https://api.github.com/repos/kapilpdev/rails/issues/events{/number}',
       "events_url": 'https://api.github.com/repos/kapilpdev/rails/events',
       "assignees_url": 'https://api.github.com/repos/kapilpdev/rails/assignees{/user}',
       "branches_url": 'https://api.github.com/repos/kapilpdev/rails/branches{/branch}',
       "tags_url": 'https://api.github.com/repos/kapilpdev/rails/tags',
       "blobs_url": 'https://api.github.com/repos/kapilpdev/rails/git/blobs{/sha}',
       "git_tags_url": 'https://api.github.com/repos/kapilpdev/rails/git/tags{/sha}',
       "git_refs_url": 'https://api.github.com/repos/kapilpdev/rails/git/refs{/sha}',
       "trees_url": 'https://api.github.com/repos/kapilpdev/rails/git/trees{/sha}',
       "statuses_url": 'https://api.github.com/repos/kapilpdev/rails/statuses/{sha}',
       "languages_url": 'https://api.github.com/repos/kapilpdev/rails/languages',
       "stargazers_url": 'https://api.github.com/repos/kapilpdev/rails/stargazers',
       "contributors_url": 'https://api.github.com/repos/kapilpdev/rails/contributors',
       "subscribers_url": 'https://api.github.com/repos/kapilpdev/rails/subscribers',
       "subscription_url": 'https://api.github.com/repos/kapilpdev/rails/subscription',
       "commits_url": 'https://api.github.com/repos/kapilpdev/rails/commits{/sha}',
       "git_commits_url": 'https://api.github.com/repos/kapilpdev/rails/git/commits{/sha}',
       "comments_url": 'https://api.github.com/repos/kapilpdev/rails/comments{/number}',
       "issue_comment_url": 'https://api.github.com/repos/kapilpdev/rails/issues/comments{/number}',
       "contents_url": 'https://api.github.com/repos/kapilpdev/rails/contents/{+path}',
       "compare_url": 'https://api.github.com/repos/kapilpdev/rails/compare/{base}...{head}',
       "merges_url": 'https://api.github.com/repos/kapilpdev/rails/merges',
       "archive_url": 'https://api.github.com/repos/kapilpdev/rails/{archive_format}{/ref}',
       "downloads_url": 'https://api.github.com/repos/kapilpdev/rails/downloads',
       "issues_url": 'https://api.github.com/repos/kapilpdev/rails/issues{/number}',
       "pulls_url": 'https://api.github.com/repos/kapilpdev/rails/pulls{/number}',
       "milestones_url": 'https://api.github.com/repos/kapilpdev/rails/milestones{/number}',
       "notifications_url": 'https://api.github.com/repos/kapilpdev/rails/notifications{?since,all,participating}',
       "labels_url": 'https://api.github.com/repos/kapilpdev/rails/labels{/name}',
       "releases_url": 'https://api.github.com/repos/kapilpdev/rails/releases{/id}',
       "deployments_url": 'https://api.github.com/repos/kapilpdev/rails/deployments',
       "created_at": '2023-05-04T01:22:08Z',
       "updated_at": '2023-05-04T01:22:09Z',
       "pushed_at": '2023-05-03T23:30:06Z',
       "git_url": 'git://github.com/kapilpdev/rails.git',
       "ssh_url": 'git@github.com:kapilpdev/rails.git',
       "clone_url": 'https://github.com/kapilpdev/rails.git',
       "svn_url": 'https://github.com/kapilpdev/rails',
       "homepage": 'https://rubyonrails.org',
       "size": 260_050,
       "stargazers_count": 0,
       "watchers_count": 0,
       "language": nil,
       "has_issues": false,
       "has_projects": true,
       "has_downloads": true,
       "has_wiki": false,
       "has_pages": false,
       "has_discussions": false,
       "forks_count": 0,
       "mirror_url": nil,
       "archived": false,
       "disabled": false,
       "open_issues_count": 0,
       "license": { "key": 'mit', "name": 'MIT License', "spdx_id": 'MIT', "url": 'https://api.github.com/licenses/mit',
                    "node_id": 'MDc6TGljZW5zZTEz' },
       "allow_forking": true,
       "is_template": false,
       "web_commit_signoff_required": false,
       "topics": [],
       "visibility": 'public',
       "forks": 0,
       "open_issues": 0,
       "watchers": 0,
       "default_branch": 'main' },
     { "id": 646_022_733,
       "node_id": 'R_kgDOJoGGTQ',
       "name": 'user-referral',
       "full_name": 'kapilpdev/user-referral',
       "private": false,
       "owner":
       { "login": 'kapilpdev',
         "id": 132_426_154,
         "node_id": 'U_kgDOB-Spqg',
         "avatar_url": 'https://avatars.githubusercontent.com/u/132426154?v=4',
         "gravatar_id": '',
         "url": 'https://api.github.com/users/kapilpdev',
         "html_url": 'https://github.com/kapilpdev',
         "followers_url": 'https://api.github.com/users/kapilpdev/followers',
         "following_url": 'https://api.github.com/users/kapilpdev/following{/other_user}',
         "gists_url": 'https://api.github.com/users/kapilpdev/gists{/gist_id}',
         "starred_url": 'https://api.github.com/users/kapilpdev/starred{/owner}{/repo}',
         "subscriptions_url": 'https://api.github.com/users/kapilpdev/subscriptions',
         "organizations_url": 'https://api.github.com/users/kapilpdev/orgs',
         "repos_url": 'https://api.github.com/users/kapilpdev/repos',
         "events_url": 'https://api.github.com/users/kapilpdev/events{/privacy}',
         "received_events_url": 'https://api.github.com/users/kapilpdev/received_events',
         "type": 'User',
         "site_admin": false },
       "html_url": 'https://github.com/kapilpdev/user-referral',
       "description": nil,
       "fork": false,
       "url": 'https://api.github.com/repos/kapilpdev/user-referral',
       "forks_url": 'https://api.github.com/repos/kapilpdev/user-referral/forks',
       "keys_url": 'https://api.github.com/repos/kapilpdev/user-referral/keys{/key_id}',
       "collaborators_url": 'https://api.github.com/repos/kapilpdev/user-referral/collaborators{/collaborator}',
       "teams_url": 'https://api.github.com/repos/kapilpdev/user-referral/teams',
       "hooks_url": 'https://api.github.com/repos/kapilpdev/user-referral/hooks',
       "issue_events_url": 'https://api.github.com/repos/kapilpdev/user-referral/issues/events{/number}',
       "events_url": 'https://api.github.com/repos/kapilpdev/user-referral/events',
       "assignees_url": 'https://api.github.com/repos/kapilpdev/user-referral/assignees{/user}',
       "branches_url": 'https://api.github.com/repos/kapilpdev/user-referral/branches{/branch}',
       "tags_url": 'https://api.github.com/repos/kapilpdev/user-referral/tags',
       "blobs_url": 'https://api.github.com/repos/kapilpdev/user-referral/git/blobs{/sha}',
       "git_tags_url": 'https://api.github.com/repos/kapilpdev/user-referral/git/tags{/sha}',
       "git_refs_url": 'https://api.github.com/repos/kapilpdev/user-referral/git/refs{/sha}',
       "trees_url": 'https://api.github.com/repos/kapilpdev/user-referral/git/trees{/sha}',
       "statuses_url": 'https://api.github.com/repos/kapilpdev/user-referral/statuses/{sha}',
       "languages_url": 'https://api.github.com/repos/kapilpdev/user-referral/languages',
       "stargazers_url": 'https://api.github.com/repos/kapilpdev/user-referral/stargazers',
       "contributors_url": 'https://api.github.com/repos/kapilpdev/user-referral/contributors',
       "subscribers_url": 'https://api.github.com/repos/kapilpdev/user-referral/subscribers',
       "subscription_url": 'https://api.github.com/repos/kapilpdev/user-referral/subscription',
       "commits_url": 'https://api.github.com/repos/kapilpdev/user-referral/commits{/sha}',
       "git_commits_url": 'https://api.github.com/repos/kapilpdev/user-referral/git/commits{/sha}',
       "comments_url": 'https://api.github.com/repos/kapilpdev/user-referral/comments{/number}',
       "issue_comment_url": 'https://api.github.com/repos/kapilpdev/user-referral/issues/comments{/number}',
       "contents_url": 'https://api.github.com/repos/kapilpdev/user-referral/contents/{+path}',
       "compare_url": 'https://api.github.com/repos/kapilpdev/user-referral/compare/{base}...{head}',
       "merges_url": 'https://api.github.com/repos/kapilpdev/user-referral/merges',
       "archive_url": 'https://api.github.com/repos/kapilpdev/user-referral/{archive_format}{/ref}',
       "downloads_url": 'https://api.github.com/repos/kapilpdev/user-referral/downloads',
       "issues_url": 'https://api.github.com/repos/kapilpdev/user-referral/issues{/number}',
       "pulls_url": 'https://api.github.com/repos/kapilpdev/user-referral/pulls{/number}',
       "milestones_url": 'https://api.github.com/repos/kapilpdev/user-referral/milestones{/number}',
       "notifications_url": 'https://api.github.com/repos/kapilpdev/user-referral/notifications{?since,all,participating}',
       "labels_url": 'https://api.github.com/repos/kapilpdev/user-referral/labels{/name}',
       "releases_url": 'https://api.github.com/repos/kapilpdev/user-referral/releases{/id}',
       "deployments_url": 'https://api.github.com/repos/kapilpdev/user-referral/deployments',
       "created_at": '2023-05-27T03:37:39Z',
       "updated_at": '2023-05-27T03:38:47Z',
       "pushed_at": '2023-05-28T08:01:07Z',
       "git_url": 'git://github.com/kapilpdev/user-referral.git',
       "ssh_url": 'git@github.com:kapilpdev/user-referral.git',
       "clone_url": 'https://github.com/kapilpdev/user-referral.git',
       "svn_url": 'https://github.com/kapilpdev/user-referral',
       "homepage": nil,
       "size": 326,
       "stargazers_count": 0,
       "watchers_count": 0,
       "language": 'Ruby',
       "has_issues": true,
       "has_projects": true,
       "has_downloads": true,
       "has_wiki": true,
       "has_pages": false,
       "has_discussions": false,
       "forks_count": 0,
       "mirror_url": nil,
       "archived": false,
       "disabled": false,
       "open_issues_count": 0,
       "license": nil,
       "allow_forking": true,
       "is_template": false,
       "web_commit_signoff_required": false,
       "topics": [],
       "visibility": 'public',
       "forks": 0,
       "open_issues": 0,
       "watchers": 0,
       "default_branch": 'main' }]
  end

  describe 'GET/index' do
    it 'will give all users' do
      get :index
      expect(response).to have_http_status(:success)
    end
  end

  describe 'POST/create' do
    it 'creates the user' do
      stub_request(:get, 'https://api.github.com/users/kapilpdev/repos')
        .with(
          headers: {
            'Accept' => '*/*',
            'Accept-Encoding' => 'gzip;q=1.0,deflate;q=0.6,identity;q=0.3',
            'User-Agent' => 'Ruby'
          }
        )
        .to_return(status: 302, body: repo_json.to_json, headers: {})

      post :create, params: { user: { username: 'kapilpdev' } }

      expect(response.status).to eq(302)
    end
  end

  describe 'GET/show' do
    let(:user) { User.create(username: 'kapilpdev') }

    it 'show the user' do
      stub_request(:get, 'https://api.github.com/users/kapilpdev/repos')
        .with(
          headers: {
            'Accept' => '*/*',
            'Accept-Encoding' => 'gzip;q=1.0,deflate;q=0.6,identity;q=0.3',
            'User-Agent' => 'Ruby'
          }
        )
        .to_return(status: 200, body: repo_json.to_json, headers: {})

      get :show, params: { id: user.id }

      expect(response.status).to eq(200)
    end
  end

  describe 'PUT/delete' do
    let(:user) { User.create(username: 'kapilpdev') }

    it 'update the user' do
      stub_request(:get, 'https://api.github.com/users/kapilpdev/repos')
        .with(
          headers: {
            'Accept' => '*/*',
            'Accept-Encoding' => 'gzip;q=1.0,deflate;q=0.6,identity;q=0.3',
            'User-Agent' => 'Ruby'
          }
        )
        .to_return(status: 302, body: repo_json.to_json, headers: {})

      delete :destroy, params: { id: user.id }

      expect(response.status).to eq(302)
    end
  end
end
