require 'json'
require 'httparty'

# open_data = [
#     [0] {
#         "category_name" => "HQ'd in NY",
#               "address" => "568 Broadway",
#          "company_name" => "20x200",
#                "hiring" => true,
#              "address2" => "11th Floor",
#              "jobs_url" => {
#             "url" => "http://www.20x200.com/jobs/"
#         },
#                   "url" => {
#             "url" => "http://www.20x200.com/"
#         },
#                  "city" => "New York"
#     }
# ]
#
# ang_lis =
# {
#          "jobs" => [
#         [0] {
#                        "id" => 17623,
#                     "title" => "Senior Developer",
#               "description" => nil,
#                "created_at" => "2013-10-11T20:58:21Z",
#                "updated_at" => "2013-10-11T20:58:21Z",
#              "equity_cliff" => "1.0",
#                "equity_min" => "0.25",
#                "equity_max" => "1.0",
#               "equity_vest" => "4.0",
#             "currency_code" => "USD",
#                  "job_type" => "full-time",
#                "salary_min" => 125000,
#                "salary_max" => 150000,
#             "angellist_url" => "https://angel.co/jobs?startup_id=151433",
#                      "tags" => [
#                 [ 0] {
#                                "id" => 14780,
#                          "tag_type" => "SkillTag",
#                              "name" => "java",
#                      "display_name" => "Java",
#                     "angellist_url" => "https://angel.co/java"
#                 },
#                 [ 1] {
#                                "id" => 14781,
#                          "tag_type" => "SkillTag",
#                              "name" => "javascript",
#                      "display_name" => "Javascript",
#                     "angellist_url" => "https://angel.co/javascript"
#                 },
#                 [ 2] {
#                                "id" => 15594,
#                          "tag_type" => "SkillTag",
#                              "name" => "jquery",
#                      "display_name" => "jQuery",
#                     "angellist_url" => "https://angel.co/jquery"
#                 },
#                 [ 3] {
#                                "id" => 15651,
#                          "tag_type" => "SkillTag",
#                              "name" => "large scale distributed systems",
#                      "display_name" => "Large-Scale Distributed Systems",
#                     "angellist_url" => "https://angel.co/large-scale-distributed-systems"
#                 },
#                 [ 4] {
#                                "id" => 15850,
#                          "tag_type" => "SkillTag",
#                              "name" => "sql",
#                      "display_name" => "SQL",
#                     "angellist_url" => "https://angel.co/sql"
#                 },
#                 [ 5] {
#                                "id" => 16999,
#                          "tag_type" => "SkillTag",
#                              "name" => "mongodb",
#                      "display_name" => "MongoDB",
#                     "angellist_url" => "https://angel.co/mongodb"
#                 },
#                 [ 6] {
#                                "id" => 17000,
#                          "tag_type" => "SkillTag",
#                              "name" => "node.js",
#                      "display_name" => "Node.js",
#                     "angellist_url" => "https://angel.co/node-js"
#                 },
#                 [ 7] {
#                                "id" => 17184,
#                          "tag_type" => "SkillTag",
#                              "name" => "ruby",
#                      "display_name" => "Ruby",
#                     "angellist_url" => "https://angel.co/ruby"
#                 },
#                 [ 8] {
#                                "id" => 18014,
#                          "tag_type" => "SkillTag",
#                              "name" => "apis",
#                      "display_name" => "APIs",
#                     "angellist_url" => "https://angel.co/apis"
#                 },
#                 [ 9] {
#                                "id" => 18323,
#                          "tag_type" => "SkillTag",
#                              "name" => "distributed systems",
#                      "display_name" => "Distributed Systems",
#                     "angellist_url" => "https://angel.co/distributed-systems"
#                 },
#                 [10] {
#                                "id" => 18501,
#                          "tag_type" => "SkillTag",
#                              "name" => "amazon ec2",
#                      "display_name" => "Amazon EC2",
#                     "angellist_url" => "https://angel.co/amazon-ec2"
#                 },
#                 [11] {
#                                "id" => 18963,
#                          "tag_type" => "SkillTag",
#                              "name" => "restful services",
#                      "display_name" => "RESTful Services",
#                     "angellist_url" => "https://angel.co/restful-services"
#                 },
#                 [12] {
#                                "id" => 22286,
#                          "tag_type" => "SkillTag",
#                              "name" => "postgresql",
#                      "display_name" => "PostgreSQL",
#                     "angellist_url" => "https://angel.co/postgresql"
#                 },
#                 [13] {
#                                "id" => 23973,
#                          "tag_type" => "SkillTag",
#                              "name" => "aws",
#                      "display_name" => "AWS",
#                     "angellist_url" => "https://angel.co/aws-1"
#                 },
#                 [14] {
#                                "id" => 31586,
#                          "tag_type" => "SkillTag",
#                              "name" => "linux",
#                      "display_name" => "Linux",
#                     "angellist_url" => "https://angel.co/linux-1"
#                 },
#                 [15] {
#                                "id" => 32868,
#                          "tag_type" => "SkillTag",
#                              "name" => "clojure",
#                      "display_name" => "Clojure",
#                     "angellist_url" => "https://angel.co/clojure"
#                 },
#                 [16] {
#                                "id" => 37332,
#                          "tag_type" => "SkillTag",
#                              "name" => "scala",
#                      "display_name" => "Scala",
#                     "angellist_url" => "https://angel.co/scala"
#                 },
#                 [17] {
#                                "id" => 75863,
#                          "tag_type" => "SkillTag",
#                              "name" => "unix",
#                      "display_name" => "Unix",
#                     "angellist_url" => "https://angel.co/unix"
#                 },
#                 [18] {
#                                "id" => 85057,
#                          "tag_type" => "SkillTag",
#                              "name" => "jvm",
#                      "display_name" => "JVM",
#                     "angellist_url" => "https://angel.co/jvm"
#                 },
#                 [19] {
#                                "id" => 114808,
#                          "tag_type" => "SkillTag",
#                              "name" => "ansible",
#                      "display_name" => "Ansible",
#                     "angellist_url" => "https://angel.co/ansible-2"
#                 },
#                 [20] {
#                                "id" => 1664,
#                          "tag_type" => "LocationTag",
#                              "name" => "new york, ny",
#                      "display_name" => "New York City",
#                     "angellist_url" => "https://angel.co/new-york-ny-1"
#                 },
#                 [21] {
#                                "id" => 14726,
#                          "tag_type" => "RoleTag",
#                              "name" => "developer",
#                      "display_name" => "Developer",
#                     "angellist_url" => "https://angel.co/developer"
#                 }
#             ],
#                   "startup" => {
#                                "id" => 151433,
#                            "hidden" => false,
#                 "community_profile" => false,
#                              "name" => "Cover",
#                     "angellist_url" => "https://angel.co/cover",
#                          "logo_url" => "https://s3.amazonaws.com/photos.angel.co/startups/i/151433-b2ca90e75977290485fc44148096e3b1-medium_jpg.jpg?buster=1360037793",
#                         "thumb_url" => "https://s3.amazonaws.com/photos.angel.co/startups/i/151433-b2ca90e75977290485fc44148096e3b1-thumb_jpg.jpg?buster=1360037793",
#                           "quality" => 10,
#                      "product_desc" => "Cover lets you enjoy your meal without having to wait for or worry about the check. It's Uber's payment experience, for restaurants.\n\nWe're live in New York and San Francisco, and growing rapidly.\n\nDownload Cover on iOS and Android: www.paywithcover.com/download",
#                      "high_concept" => "Uber's payment experience at restaurants.",
#                    "follower_count" => 1579,
#                       "company_url" => "http://www.paywithcover.com/",
#                        "created_at" => "2012-12-31T04:20:00Z",
#                        "updated_at" => "2014-05-29T20:08:37Z"
#             }
#         }
#     ],
#         "total" => 1333,
#      "per_page" => 1,
#          "page" => 1,
#     "last_page" => 1333
# }


def search(search_term)

  co_srch = HTTParty.get("https://api.angel.co/1/search?query=#{search_term}&tag_type=CompanyTypeTag")

  co_id = co_srch.select {|x| x["name"].downcase == "#{search_term}".downcase}

  co_profile = HTTParty.get("https://api.angel.co/1/startups/#{co_id[0]["id"]}")

  site_profile = {
    "ang_list_co_id" => co_profile["id"],
    "co_name" => co_profile["name"],
    "co_url" => co_profile["logo_url"],
    "co_description" => co_profile["product_desc"],
    "co_twitter" => co_profile["twitter_url"]
     }
end

binding.pry
