# Instagram archive
Archives a set of profiles specified in a text file on a schedule - keeping the archive fresh.

## Configuration
### Profiles
You can set the targets to archive in the file: `~/.automation/archive-instagram.txt`.

The file contents should follow the syntax of [Instaloader targets](https://instaloader.github.io/basic-usage.html#what-to-download). Your file will probably look something like this:

```
:saved
"#hashtag"
profile1
profile2
```

Which will archive:
* Your saved / bookmarked posts (must set up your session, see next section)
* Posts matching the hastag `#hashtag`
* All the posts for `profile1` and `profile2`

### Session
If you sign in to Instagram via Instaloader, and save the session to `~/.automation/archive-instagram.session` (make sure you set the permissions to not allow reading by any user or group but you), you will get a few more things archived per profile:

* Stories
* Highlights

### Schedule
The schedule for this service is defined in the systemd time, located at `systemd/archive-instagram.timer`.

Set how often it should run in the `OnUnitInactiveSec` property. This will start a timer of that length every time the script exits (or after boot).

There is also a `RandomizedDelaySec` property, which will randomly delay the execution up to that amount of time. This isn't absolutely necessary, but can be helpful if wanting to prevent so many automation scripts from running at exactly the same time.