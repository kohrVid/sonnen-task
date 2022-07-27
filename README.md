# Object Selection Model

<!-- vim-markdown-toc GFM -->

* [Requirements](#requirements)
* [Usage](#usage)
* [Original Specification](#original-specification)

<!-- vim-markdown-toc -->

## Requirements

* Ruby 3.1.1
* Rails 6.1.6.1 +

An sqlite3 database is in use so an external database is not required


## Usage

Run:

    rails s


## Original Specification

Dear Sargent Kyle Reese,

We appreciate the work you've done during all these years in *The Resistance*.
Your skills and knowledge of battle and weaponry are remarkable. That is why we
need your help to modify a model *T-800* we just captured. As you well know
from your extensive experience, this is the first cybernetic organism that uses
living tissue on a metal skeleton.

Your **mission** will consist of reprogramming the **objective selection
module**. This module is responsible for selecting the next position to attack
given several possible attack positions. The cyborg control unit will
communicate via *HTTP POST* requests with your module, providing the data that
the vision module has collected.

The objective of the mission is to develop an **HTTP endpoint** that accepts
**JSON** data and returns **JSON** data.

This is an example of a request from the control unit to your module:

```json
[
  {
    "attack-­mode": [
      "closest­-first"
    ],
    "radar": [
      {
        "position": {
          "x":0,
          "y":40
        },
        "targets": [
          {
            "type": "T1-­9",
            "damage": 80
          },
          {
            "type": "HK-­Tank",
            "damage": 20
          },
          {
            "type": "Human"
          }
        ]
      },
      {
        "position": {
          "x": 2,
          "y":60
        },
        "targets": [
          {
            "type":"T1­-9",
            "damage": 40
          }
        ]
      },
      ...
```

And here's a definition of the properties:

- **attack-­mode​**: Chosen mode for the attack.
- **radar**
  - **position**: Target group position.
    - **x**: X coordinate.
    - **y**: Y coordinate.
  - **targets​**: Found targets.
    - **type​**: Target type.
    - **damage​**: Damage the target may cause.

Given the previous request, your module should return a response like this:

```json
{ "position": { "x": 0, "y": 40 }, "targets": [ "T1­-9", "HK­-Tank" ] }
```

The attack modes we have implemented are:

- **closest-first**: Attack the nearest areas.
- **furthest-first**: Attack the furthest areas.
- **avoid-crossfire​**: Do not attack any area where any human is present.
- **priorize-t-x**: The attack must always priorize objectives of type T-X.

The types of objectives that the vision system will provide are:

- **Human**
- **T1-9**
- **T7-T**
- **T-X**
- **HK-Airstrike**
- **HK-Bomber**
- **HK-Tank**

Keep in mind that attack modes can be chained but you should not chain opposite
attack modes, like closest-first and furtherst-first. Example:

```json
[{ "attack-­mode": [ "closest­-first", "priorize­-t-­x" ], "radar": ...
```

You must not forget that Skynet is building a new army of cyborgs, the system
should be prepared to add new attack modes.

By running the `test_attack.sh` script (or `test_attack.rb` ruby script, as you
prefer) on your machine, you will have access to a battery of tests to test your
combat module, present in the `test_cases.json` file. Find both files below.

At the end of the mission, you must compress all source files with the
**unmodified** `test_attack.sh` file included in a file called
`<your-name>_codetest_sonnen.zip` and send it back to us.

PS: Add to the compressed file any document that you have generated to solve the
problem even if it is just a text file, a diagram, etc. because we will also
evaluate the problem solving approach, not only the final solution.

Good luck,

The Resistance
