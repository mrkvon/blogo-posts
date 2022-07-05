As an application developer,

# I need [Solid](https://solidproject.org) to change

## TL;DR

With Solid, I want to make great apps that connect us to share ideas, collaborate, and be together in real world.

For this, as a developer, I need a few changes into how Solid works:

1. Make data queryable with LDF (This would allow us to drop type indexes, and stop all worries about discoverability of data on a pod)
2. Don't enforce shape trees (Data want to live independently of documents. Rigid document structures are not a way to interoperability. Shared data shapes are.)
3. Allow each piece of data to have its own permissions. (Otherwise managing permissions just gets too complex.)
4. Serve different linked data formats. Especially JSON-LD; not just Turtle. (I don't care for RDFXML. ;) ) Just like that, we could be compatible with ActivityPub, which uses JSON-LD.

I also propose that we should have a place to share and discuss our application's data shapes. The provisional name is Linked Data Shape Manager, along the lines of Node Package Manager. :)

I also propose that Solid developers should meet regularly.

We need a more granular way to give permissions to apps. Permissions based on shapes.

---

Now, let's look at it in more detail...


## First, the promise

I love the promise Solid offers. The ultimate social network that developers don't have to reinvent - it already exists. Developer just makes apps that improve what people can do in it.

I learned this the hard way: When a social network wants to connect people, [it needs people](https://en.wikipedia.org/wiki/Network_effect), otherwise it's doomed. In Solid, we don't compete. When one app attracts new people, all apps are better off, because they all gain potential new users.


## My hopes

Internet which connects people and encourages us to collaborate and spend more time in reality instead of trapping us online.


## Getting technical

In Solid, it's important for me that:

- I can store data. (We store them as Linked Data, in triples. That's nice i guess. But it has its limits. I can say i like something, but it's not straightforward to express _how much_ i like it.)
- I can have an identity. I can own my data, and I can decide who can see or edit them, and who can't. I can authenticate and see data that other people shared with me.

Now, let's look at these two points more closely:


### Identity and authentication

I'm happy with how this works. It's based on [OpenID Connect](https://openid.net/connect/). And it functions as expected.


### Data

Data are the basic building stones of information. It's not documents. Data don't care what format they're stored in.

And so...

#### Think in Data, not Documents

There is no such thing as document structure. In "Shape Trees" we don't specify document structure, but data structure that our app expects.

No need for type indexes. It's no coincidence that they're so counter-intuitive and unpleasant to use.
Generally, app developers are confused where to find and store the data their app needs. Not any more.

Decouple data from documents, and you solve the never-ending interoperability issues.

We can query them with a linked data fragments endpoint, sort of like https://data.verborgh.org/ruben

## Think in data, not mime types

I like Turtle, but it's not necessary. RDF is just two nodes with arrow between them. And ... That's ... It.

## Granular permissions

Each triple has its own permissions tied to it. This allows people to make fine-grained settings for the data they own. For each datum they can specify permissions for each individual or group they want to share with.

Apps ask for, and may receive, very specific permissions: This datum you can read, this shape you can create, this shape you can edit.

Let's say my application works with people and their interests. So it works with data of form (Person) --foaf:topic\_interest--> (Thing)
When somebody decides to share one interest with everybody, and the other only with their family, i simply don't see the private parts. The family will see a slightly different document, and that's it!

When i want to publish, or make private a specific triple, i have to move it to a different document, with different permissions. That Just Sucks. It breaks the uris.

Dump [WAC](Link!). It is concerned with documents and their permissions, not data. Not fitting this view. Why do we even need to express access control as linked data? Only the owner should ever be able to change it.

The asking for application permissions only once at the beginning is too simplifying, and too generic.

I think - but this is a shot in the dark, that typical change of permissions can look as follows - the app suggests change in permissions, person is redirected to their app and changes the permissions, if they want to. Sort of like when we sign in.


<!--
## What i need as an application developer

I need to connect data.


## Solid Data Pod

The Solid Data Pod i hope for will be a little bit like wikidata. I'll be able to access various documents either by querying them directly, or through LDF API. + Authentication. Everybody can query wikidata. Everybody will be able to query this kind of pod, but each will see a little different picture

-->

---

Work in progress. To be continued...
