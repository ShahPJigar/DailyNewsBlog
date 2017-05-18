/*
 * Copyright (c) Jigar Shah
 *
 * Licensed under the Apache License, Version 2.0 (the "License");
 * you may not use this file except in compliance with the License.
 * You may obtain a copy of the License at
 * 
 *   http://www.apache.org/licenses/LICENSE-2.0
 *
 * Unless required by applicable law or agreed to in writing, software
 * distributed under the License is distributed on an "AS IS" BASIS,
 * WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
 * See the License for the specific language governing permissions and
 * limitations under the License.
 *
 */

package course;

import com.mongodb.client.MongoCollection;
import com.mongodb.client.MongoDatabase;
import static com.mongodb.client.model.Filters.*;
import static java.util.Arrays.asList;

import com.mongodb.client.result.DeleteResult;
import com.mongodb.client.result.UpdateResult;
import org.bson.Document;
import org.bson.conversions.Bson;

import java.util.ArrayList;
import java.util.GregorianCalendar;
import java.util.List;

public class NewsPostDAO {
    MongoCollection<Document> postsCollection;

    public NewsPostDAO(final MongoDatabase newsDatabase) {
        postsCollection = newsDatabase.getCollection("posts");
    }

    public Document findByPermalink(String permalink) {
        Document post = postsCollection.find(new Document("permalink", permalink)).first();
        return post;
    }

    public boolean deleteByPermalink(String permalink) {
        Bson filter = in("permalink",permalink);
        DeleteResult deletepost = postsCollection.deleteOne(filter);
        return false;
    }

    public List<Document> findByDateDescending(int limit) {

        List<Document> posts = postsCollection.find().sort(new Document("date", -1)).limit(limit).into(new ArrayList<Document>());
        return posts;
    }

    public List<Document> findByHotWords(int limit) {

        List<Document> pipeline = asList(new Document("$unwind", "$tags"),
                new Document("$group", new Document("_id", "$tags").append("count", new Document("$sum", 1))),
                new Document ("$sort", new Document("count", -1)),
                new Document ("$limit", limit),
                new Document ("$project", new Document("_id", 0).append("hottags", "$_id").append("count", 1)));

        List<Document> hotwords = postsCollection.aggregate(pipeline).into(new ArrayList<Document>());

        return hotwords;
    }

    public List<Document> findByPublisher(int limit) {

        List<Document> pipeline = asList(new Document("$group", new Document("_id", "$author").append("count", new Document("$sum", 1))),
                new Document ("$sort", new Document("count", -1)),
                new Document ("$limit", limit),
                new Document ("$project", new Document("_id", 0).append("geek", "$_id").append("count", 1)));

        List<Document> publisher = postsCollection.aggregate(pipeline).into(new ArrayList<Document>());

        return publisher;
    }

    public List<Document> findByCommenter(int limit) {

        List<Document> pipeline = asList(new Document("$unwind", "$comments"),
                new Document("$group", new Document("_id", "$comments.author").append("count", new Document("$sum", 1))),
                new Document ("$sort", new Document("count", -1)),
                new Document ("$limit", limit),
                new Document ("$project", new Document("_id", 0).append("nerd", "$_id").append("count", 1)));

        List<Document> commenter = postsCollection.aggregate(pipeline).into(new ArrayList<Document>());

        return commenter;
    }

    public List<Document> findByUserNameDescending(final String username) {

          Bson filter = in("author",username);

        List<Document> posts = postsCollection.find(filter).sort(new Document("date", -1)).into(new ArrayList<Document>());
        return posts;
    }

    public List<Document> findByTagDateDescending(final String tag) {

        Bson filter = in("tags",tag);

        List<Document> posts = postsCollection.find(filter).sort(new Document("date", -1))
                .limit(10).into(new ArrayList<Document>());
        return posts;
    }

    public String addPost(String title, String body, List tags, String username) {

        String permalink = title.replaceAll("\\s", "_"); // whitespace becomes _
        permalink = permalink.replaceAll("\\W", ""); // get rid of non alphanumeric
        permalink = permalink.toLowerCase();

        String permLinkExtra = String.valueOf(GregorianCalendar
                .getInstance().getTimeInMillis());
        permalink += permLinkExtra;

        Document post = new Document("title", title);
        post.append("author", username);
        post.append("body", body);
        post.append("permalink", permalink);
        post.append("tags", tags);
        post.append("comments", new java.util.ArrayList());
        post.append("date", new java.util.Date());

        try {
            postsCollection.insertOne(post);
            System.out.println("Inserting blog post with permalink " + permalink);
        } catch (Exception e) {
            System.out.println("Error inserting post");
            return null;
        }
        return permalink;
    }

    public void addPostComment(final String name, final String email, final String body, final String permalink) {
        Document comment = new Document("author", name)
                .append("body", body);
        if (email != null && !email.equals("")) {
            comment.append("email", email);
        }

       UpdateResult result = postsCollection.updateOne(new Document("permalink", permalink),
                new Document("$push",
                        new Document("comments", comment)));

    }

}
