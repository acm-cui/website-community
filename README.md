# ACM Conversational User Interfaces community website

The ACM CUI community website is build using Jekyll, on GitHub Pages.

## Steering Commmitee membership, nominations and elections

Information about officers and members of the Steering Commmittee is stored in `_data/sc.yml` in four lists, one for _officers_ of the Steering Committee (`officers`), one for _members_ of the Steering Committee (`members`), one for elections to the Steering Committee (`elections`), and one for nominations for elections to the Steering Committee (`nominations`). There is additionally one associative array, `nominations_settings`, which contains information used in the Call for Nominations.

Each item in the `officers` and `members` lists consists of an associative array with the following structure:

| **Key** | **Required?** | **Type** | **Explanation**                                                                                                                                         | **Example**                              |
|---------|---------------|----------|---------------------------------------------------------------------------------------------------------------------------------------------------------|------------------------------------------|
| name    | Yes           | string   | Name of the Officer/Member                                                                                                                              | `Minha Lee`                              |
| photo   | Yes           | string   | Filename of a square profile photo the Officer/Member, stored in `assets/img/sc/`                                                                       | `minha-lee.png`                          |
| url     | No            | string   | URL/personal website for the Officer/Member                                                                                                             | `https://minha-lee.github.io`            |
| roles   | No            | list     | List of associate arrays, for each role the Officer/Member holds on the committee. Each array consists of two keys: `role` (string) and `term` (string) | `role: Co-Chair`<br>`term: 2024–2027`    |

Each item in the `elections` list consists of an associative array with the following structure:

| **Key**       | **Required?** | **Type**     | **Explanation**                                                                                                                                          | **Example**                                     |
|---------------|---------------|--------------|----------------------------------------------------------------------------------------------------------------------------------------------------------|-------------------------------------------------|
| `title`       | Yes           | string       | Name of the office                                                                                                                                       | `CoChair`                                       |
| `term`        | Yes           | string       | Years the elected individual will serve                                                                                                                  | `2023–2026`                                     |
| `nominations` | Yes           | assoc. array | A list of all those nominated, where each list item is an associative array.<br><br>Each item consists of two keys: name (`name`) and biography (`bio`). | `name: Minha Lee`<br><br>`bio: Minha Lee is...` |

Each item in the `nominations` list consists of an associative array with the following structure:

| **Key**       | **Required?** | **Type** | **Explanation**                         | **Example**        |
|---------------|---------------|----------|-----------------------------------------|--------------------|
| `title`       | Yes           | string   | Name of the office                      | `Co-Chair`         |
| `term`        | Yes           | string   | Years the elected individual will serve | `2023–2026`        |
| `explanation` | Yes           | string   | An explanation of what the role entails | `The Co-Chair....` |

The `nominations_settings` associative array consists of the following data:

| **Key**    | **Required?** | **Type**     | **Explanation**                                                                                                                                                                                             | **Example**                                             |
|------------|---------------|--------------|-------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------|---------------------------------------------------------|
| `link`     | Yes           | string       | Link to the nomination form                                                                                                                                                                                 | `CoChair`                                               |
| `deadline` | Yes           | string       | Deadline for nominations in the format YYYY-MM-DD                                                                                                                                                           | `2023-05-27`                                            |
| `contact`  | Yes           | assoc. array | Who individuals should contact, should they have any questions.<br><br>This consists of two required keys: the name of the individual to contact (`name`, string) and their email address (`email`, string) | `name: Benjamin Cowan`<br>`email:benjamin.cowan@ucd.ie` |

## Constitution

The file `_data/const.yml` contains information relating to the Constitution of the Steering Committee, and has the following data:

| **Key** | **Required?** | **Type** | **Explanation**                                     | **Example**                                   |
|---------|---------------|----------|-----------------------------------------------------|-----------------------------------------------|
| `path`  | Yes           | string   | Path to the PDF of the constitution                 | `/assets/pdf/cui-conference-constitution.pdf` |
| `date`  | Yes           | string   | Date the constitution was last updated and approved | `2024-04-19`                                  |


## Conference data

Data from annual conferences is stored in a number of different files and locations.

### Conferences list

Primary conference data (that is, conference names, dates, URLs, sponsors, and awards) is stored in `_data/conf.yml` file. Data is stored as a series of associative arrays, one for each year of the conference. Each associative array should be given the key of the full conference year (e.g., `2025`). Each associative array consists of a series of items, each of which are described below.

| **Key**       | **Required?** | **Type**      | **Explanation**                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                        | **Example**                                                                                                                                                                                                                                                                                                                                                                                                                 |
|---------------|---------------|---------------|------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------|-----------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------|
| `name`        | Yes           | string        | Name of the conference                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                 | `ACM CUI 2025`                                                                                                                                                                                                                                                                                                                                                                                                              |
| `location`    | Yes           | string        | Location of the conference                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                             | `Waterloo, ON, Canada`                                                                                                                                                                                                                                                                                                                                                                                                      |
| `dates`       | Yes           | assoc. array  | Must contain two items:  _start_ and _end_, both of which are dates formatted as YYYY-MM-DD                                                                                                                                                                                                                                                                                                                                                                                                                                                                            | `start: 2025-07-08`<br>`end: 2025-07-10`                                                                                                                                                                                                                                                                                                                                                                                    |
| `logo`        | Yes           | string        | Filename for a square image stored in `assets/img/conferences/`                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                        | `cui2025.png`                                                                                                                                                                                                                                                                                                                                                                                                               |
| `urls`        | No            | assoc. array  | Names and URLs for different conference pages. Expected keys: _website_, _proceedings_, and _programme_                                                                                                                                                                                                                                                                                                                                                                                                                                                                | `website:`<br>`  name: Website`<br>`  link: https://cui.acm.org/2025/`                                                                                                                                                                                                                                                                                                                                                          |
| `sponsors`    | No            | list          | Names and URLs for conference sponsors                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                 | `name: SIGCHI`<br>`link: https://www.sigchi.org/`                                                                                                                                                                                                                                                                                                                                                                         |
| `awards`      | No            | assoc. array  | Three data for Honourable Mentions (`hon_mentions`), Best Paper (`best_paper`), and Outstanding Service (`outstanding_service`) awards given at a conference. The value for each item is a list of recipients, with data as an assoc. array.<br><br>`best_papers` and `hon_mentions` items have the following keys: `title` (string), `authors` (string, for authors list with Oxford comma), and `dl` (string, for ACM Digital Library link).<br><br>`outstanding_service` has the following keys: `recipient` (string), `role` (string), and `explanation` (string). | `best_papers:`<br>` - title: Progressivity for Voice...`<br>`   authors: Joel E Fischer, ...`<br>`  dl: https://doi.org/10.1145/...`<br>`hon_mentions:`<br>` - title: Crowdsourcing a self-evolving...`<br>`   authors: Patrik Jonell, ...`<br>`   dl: https://doi.org/abs/10.1145/...`<br>`outstanding_service:`<br>` - recipient: Justin Edwards`<br>`   role: Hybrid Chair`<br>`   explanation: The CUI 2023 General...` |
| `listdetails` | No            | assoc. array  | Information used in the conference list page. Supported keys: _preamble_ (adds text prior to the 'About' summary for a conference')                                                                                                                                                                                                                                                                                                                                                                                                                                    | `preamble: >`<br>`  Where it all began!`                                                                                                                                                                                                                                                                                                                                                                                    |

### Conference statistics

The file `_data/stats.yml` contains programme and registration statistics for each conference year. There are four associative arrays in this file.

The `years` list is the years for which should be included in conference statistics. This can be used to avoid including empty data for a conference before any statistics have been compiled, but after tracks have been entered.

The `registrations_footnotes` list is a series of explanations for registration numbers. Each footnote may be reused for more than one conference. Conferences can attach a footnote using the `footnote_id` key.

The `registrations` associative array has the following structure:

| **Key**       | **Required?** | **Type** | **Explanation**                                                                                                              | **Example** |
|---------------|---------------|----------|------------------------------------------------------------------------------------------------------------------------------|-------------|
| `total`       | Yes           | string   | Total number of registrations including free registrations such as invited speakers, student volunteers, and organisers etc. | `67`        |
| `virtual`     | Yes           | string   | Number of registrations for remote/virtual attendance                                                                        | `0`         |
| `footnote_id` | No            | int      | Index of a footnote (from `registrations_footnotes` list). Starting index is 1 (i.e., first footnote is index 1).            | `1`         |

The `tracks` list contains items with the following structure:

| **Key**    | **Required?** | **Type**     | **Explanation**                                          | **Example**                                          |
|------------|---------------|--------------|----------------------------------------------------------|------------------------------------------------------|
| `title`    | Yes           | string       | Name of the track                                        | `title: Doctoral Consortium`                         |
| `lang`     | Yes           | string       | How to describe submissions/acceptances (in a sentence)  | `title: Doctoral Consortium submissions`             |
| `data`     | No            | assoc. array | Submissions and acceptances for a track for a given year | `2019:`<br>`  submissions: 28`<br>`  acceptances: 9` |

### Conference Expressions of Interest

The announcement of an Expression of Interest to host a future conference is configured in `_data/conf_host.yml`, with the following data:

| **Key**      | **Required?** | **Type** | **Explanation**                             | **Example**                         |
|--------------|---------------|----------|---------------------------------------------|-------------------------------------|
| `show`       | Yes           | bool     | Show the EOI section on the conference page | `true`                              |
| `preamble`   | Yes           | string   | Information shown at top of the EOI         | `For its fifth iteration,`          |
| `postamble`  | Yes           | string   | Information shown at bottom of the EOI      | `Expressions of Interest will...`   |
| `conference` | Yes           | string   | Name of the conference                      | `ACM CUI 2023`                      |
| `form`       | Yes           | string   | URL of the EOI form                         | `https://docs.google.com/forms....` |

## Workshops

File file `_data/ws.yml` contains information about satellite workshops affiliated with the ACM CUI community. The newest conference should be at the top of the list. The file contains a list of associative arrays with the key-value pairs:

| **Key**      | **Required?**                  | **Type**     | **Explanation**                                                                                                                     | **Example**                                            |
|--------------|--------------------------------|--------------|-------------------------------------------------------------------------------------------------------------------------------------|--------------------------------------------------------|
| `title`      | Yes                            | string       | Title of the workshop (do not include CUI@...)                                                                                      | `Collaborating through Conversational User Interfaces` |
| `location`   | Yes                            | string       | City and country of there workshop                                                                                                  | `Virtual Event` or `Portland, OR, USA`                 |
| `date`       | Must include `date` or `dates` | string       | Date of the workshop                                                                                                                | `2020-10-17`                                           |
| `dates`      | Must include `date` or `dates` | assoc. array | Dates of the workshop as an associative array with two keys for the starting date (`start`, string) and ending date (`end`, string) | `start: 2020-10-17`<br>`end: 2020-10-18`               |
| `conference` | Yes                            | string       | Conference the workshop will be co-located at                                                                                       | `CSCW 2020`                                            |
| `url`        | No                             | string       | URL of the workshop website                                                                                                         | `https://cui.acm.org/workshops/CSCW2020/`              |
