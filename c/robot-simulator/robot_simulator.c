#include "robot_simulator.h"
#include "string.h"
#include "stdio.h"

robot_status_t robot_create(robot_direction_t direction, int x, int y) {
    return (robot_status_t) { direction, { x, y } };
}

void robot_move(robot_status_t *robot, const char *commands) {
    for (const char *command = commands; *command; command++) {
        switch (*command) {
            case 'R':
                robot->direction++;
                if (robot->direction == DIRECTION_MAX) robot->direction = DIRECTION_DEFAULT;

                break;
            case 'L':
                if (robot->direction == DIRECTION_DEFAULT) robot->direction = DIRECTION_MAX;
                robot->direction--;

                break;
            case 'A':
                if (robot->direction == DIRECTION_NORTH) robot->position.y++;
                else if (robot->direction == DIRECTION_SOUTH) robot->position.y--;
                else if (robot->direction == DIRECTION_EAST) robot->position.x++;
                else robot->position.x--;

                break;
        }
    }
}
