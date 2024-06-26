﻿--[[--

**Configuration Values:**.

- DoorCost: The Cost of a door | integer.

- DoorSellRatio: Percentage you can sell a door for | float.

- DoorLockTime: Time it takes to lock a door | float.
]]
-- @configurations Doors
DOOR_OWNER = 3
DOOR_TENANT = 2
DOOR_GUEST = 1
DOOR_NONE = 0
MODULE.name = "Utilities - Doors"
MODULE.author = "76561198312513285"
MODULE.discord = "@liliaplayer"
MODULE.desc = "Adds Doors that can be bought"
ACCESS_LABELS = {
    [DOOR_OWNER] = "owner",
    [DOOR_TENANT] = "tenant",
    [DOOR_GUEST] = "guest",
    [DOOR_NONE] = "none",
}
