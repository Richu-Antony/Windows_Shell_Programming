@echo off
title Starting Hex

mode con: cols=54 lines=21

rem set /p password=Enter password: 

REM goto dropdown

echo __[0000]_____________________________________
echo ^<127.0.0.1^>................................
echo 0
echo 1
echo 2
echo 3
echo 4
echo 5
echo 6
echo 7
echo 8
echo 9
echo a
echo b
echo c
echo d
echo e
echo f
echo .................................^<no-server^>
echo __[xxxx]_____________________________________

timeout 1 >nul /NOBREAK
cls

echo __[0000]_____________________________________
echo ^<127.0.0.1^>................................
echo 0
echo 1
echo 2
echo 3
echo 4
echo 5
echo 6
echo 7                        ^<^>
echo 8
echo 9
echo a
echo b
echo c
echo d
echo e
echo f
echo .................................^<no-server^>
echo __[xxxx]_____________________________________

timeout 1 >nul /NOBREAK
cls


echo __[0000]_____________________________________
echo ^<127.0.0.1^>................................
echo 0
echo 1
echo 2
echo 3
echo 4
echo 5
echo 6
echo 7                       ^<  ^>
echo 8
echo 9
echo a
echo b
echo c
echo d
echo e
echo f
echo .................................^<no-server^>
echo __[xxxx]_____________________________________

timeout 1 >nul /NOBREAK
cls

echo __[0000]_____________________________________
echo ^<127.0.0.1^>................................
echo 0
echo 1
echo 2
echo 3
echo 4
echo 5
echo 6                        /\
echo 7                       ^|  ^|
echo 8                        \/
echo 9
echo a
echo b
echo c
echo d
echo e
echo f
echo .................................^<no-server^>
echo __[xxxx]_____________________________________

for /L %%x in (1,1,3) Do (
	ping -n 1 -w 1 127.0.0.1 1>nul
)
cls

echo __[0000]_____________________________________
echo ^<127.0.0.1^>................................
echo 0
echo 1
echo 2
echo 3
echo 4
echo 5
echo 6                       /   \
echo 7                      ^|     ^|
::echo 12345678912345678976543210C01234567890123456789
echo 8                       \   /
echo 9
echo a
echo b
echo c
echo d
echo e
echo f
echo .................................^<no-server^>
echo __[xxxx]_____________________________________

timeout 0 >nul /NOBREAK
cls

echo __[0000]_____________________________________
echo ^<127.0.0.1^>................................
echo 0
echo 1
echo 2
echo 3
echo 4
echo 5                         X
echo 6                       X   X
echo 7                      X     X
echo 8                       X   X
echo 9                         X
echo a
echo b
echo c
echo d
echo e
echo f
echo .................................^<no-server^>
echo __[xxxx]_____________________________________

timeout 0 >nul /NOBREAK
cls

echo __[0000]_____________________________________
echo ^<127.0.0.1^>................................
echo 0
echo 1
echo 2
echo 3
echo 4
echo 5                      X  X  X
echo 6                            
echo 7                      X     X
::echo 12345678912345678976543210C01234567890123456789
echo 8                            
echo 9                      X  X  X
echo a
echo b
echo c
echo d
echo e
echo f
echo .................................^<no-server^>
echo __[xxxx]_____________________________________

timeout 0 >nul /NOBREAK
cls

echo __[0000]_____________________________________
echo ^<127.0.0.1^>................................
echo 0
echo 1
echo 2
echo 3 
echo 4                      XXXXXXX
echo 5                     X       X
echo 6                    X         X
echo 7                   X           X
echo 8                    X         X
echo 9                     X       X
echo a                      XXXXXXX
echo b
echo c
echo d
echo e
echo f
echo .................................^<no-server^>
echo __[xxxx]_____________________________________

::echo 12345678912345678976543210C01234567890123456789
timeout 0 >nul /NOBREAK


echo __[0000]_____________________________________
echo ^<127.0.0.1^>................................
echo 0 #
echo 1 1
echo 2 #
echo 3 #
echo 4 0                    XXXXXXX
echo 5 #                   X       X
echo 6 #                  X         X
echo 7 #                 X           X
echo 8 #                  X         X
echo 9 #                   X       X
echo a #                    XXXXXXX
echo b #
echo c #
echo d #
echo e #
echo f #
echo .................................^<no-server^>
echo __[xxxx]_____________________________________
timeout 0 >nul /NOBREAK

echo __[0000]_____________________________________
echo ^<127.0.0.1^>................................
echo 0  #
echo 1 1#
echo 2  #
echo 3  #
echo 4 0#                   XXXXXXX
echo 5  #                  X       X
echo 6  0                 X         X
echo 7  #                X           X
echo 8  #                 X         X
echo 9  #                  X       X
echo a  #                   XXXXXXX
echo b  #
echo c  #
echo d  #
echo e  1
echo f  #
echo .................................^<no-server^>
echo __[xxxx]_____________________________________
timeout 0 >nul /NOBREAK

echo __[0000]_____________________________________
echo ^<127.0.0.1^>................................
echo 0   1
echo 1 1 #
echo 2   0
echo 3   #
echo 4 0 #                  XXXXXXX
echo 5   #                 X       X
echo 6  0#                X         X
echo 7   #               X           X
echo 8   #                X         X
echo 9   #                 X       X
echo a   #                  XXXXXXX
echo b   #
echo c   #
echo d   #
echo e  1#
echo f   #
echo .................................^<no-server^>
echo __[xxxx]_____________________________________
timeout 0 >nul /NOBREAK

echo __[0000]_____________________________________
echo ^<127.0.0.1^>................................
echo 0   1#
echo 1 1  1
echo 2   0#
echo 3    #
echo 4 0  #                 XXXXXXX
echo 5    #                X       X
echo 6  0 0               X         X
echo 7    #              X           X
echo 8    #               X         X
echo 9    #                X       X
echo a    #                 XXXXXXX
echo b    #
echo c    #
echo d    #
echo e  1 #
echo f    #
echo .................................^<no-server^>
echo __[xxxx]_____________________________________
timeout 0 >nul /NOBREAK

echo __[0000]_____________________________________
echo ^<127.0.0.1^>................................
echo 0   1 #
echo 1 1  1#
echo 2   0 #
echo 3     #
echo 4 0   1                XXXXXXX
echo 5     #               X       X
echo 6  0 0#              X         X
echo 7     0             X           X
echo 8     #              X         X
echo 9     #               X       X
echo a     #                XXXXXXX
echo b     #
echo c     #
echo d     #
echo e  1  #
echo f     #
echo .................................^<no-server^>
echo __[xxxx]_____________________________________
timeout 0 >nul /NOBREAK

echo __[0000]_____________________________________
echo ^<127.0.0.1^>................................
echo 0   1  #
echo 1 1  1 #
echo 2   0  #
echo 3      #
echo 4 0   11               XXXXXXX
echo 5      #              X       X
echo 6  0 0 #             X         X
echo 7     00            X           X
echo 8      #             X         X
echo 9      #              X       X
echo a      #               XXXXXXX
echo b      #
echo c      #
echo d      #
echo e  1   #
echo f      #
echo .................................^<no-server^>
echo __[xxxx]_____________________________________
timeout 0 >nul /NOBREAK

echo __[0000]_____________________________________
echo ^<127.0.0.1^>................................
echo 0   1   #
echo 1 1  1  #
echo 2   0   #
echo 3       #
echo 4 0   11#              XXXXXXX
echo 5       1             X       X
echo 6  0 0  0            X         X
echo 7     00#           X           X
echo 8       #            X         X
echo 9       #             X       X
echo a       #              XXXXXXX
echo b       #
echo c       #
echo d       #
echo e  1    #
echo f       #
echo .................................^<no-server^>
echo __[xxxx]_____________________________________
timeout 0 >nul /NOBREAK


echo __[0000]_____________________________________
echo ^<127.0.0.1^>................................
echo 0   1    #
echo 1 1  1   #
echo 2   0    #
echo 3        #
echo 4 0   11 #             XXXXXXX
echo 5       1#            X       X
echo 6  0 0  00           X         X
echo 7     00 #          X           X
echo 8        #           X         X
echo 9        #            X       X
echo a        #             XXXXXXX
echo b        #
echo c        #
echo d        #
echo e  1     1
echo f        #
echo .................................^<no-server^>
echo __[xxxx]_____________________________________
timeout 0 >nul /NOBREAK

echo __[0000]_____________________________________
echo ^<127.0.0.1^>................................
echo 0   1     #
echo 1 1  1    #
echo 2   0     #
echo 3         #
echo 4 0   11  1            XXXXXXX
echo 5       1 #           X       X
echo 6  0 0  00#          X         X
echo 7     00  0         X           X
echo 8         #          X         X
echo 9         #           X       X
echo a         #            XXXXXXX
echo b         #
echo c         #
echo d         #
echo e  1     1#
echo f         #
echo .................................^<no-server^>
echo __[xxxx]_____________________________________
timeout 0 >nul /NOBREAK

echo __[0000]_____________________________________
echo ^<127.0.0.1^>................................
echo 0   1      #
echo 1 1  1     #
echo 2   0      #
echo 3          #
echo 4 0   11  1#           XXXXXXX
echo 5       1  #          X       X
echo 6  0 0  00 0         X         X
echo 7     00  0#        X           X
echo 8          #         X         X
echo 9          1          X       X
echo a          #           XXXXXXX
echo b          #
echo c          #
echo d          #
echo e  1     1 #
echo f          #
echo .................................^<no-server^>
echo __[xxxx]_____________________________________
timeout 0 >nul /NOBREAK

echo __[0000]_____________________________________
echo ^<127.0.0.1^>................................
echo 0   1       #
echo 1 1  1      #
echo 2   0       #
echo 3           #
echo 4 0   11  1 #          XXXXXXX
echo 5       1   #         X       X
echo 6  0 0  00 00        X         X
echo 7     00  0 #       X           X
echo 8           #        X         X
echo 9          1#         X       X
echo a           #          XXXXXXX
echo b           #
echo c           #
echo d           #
echo e  1     1  #
echo f           1
echo .................................^<no-server^>
echo __[xxxx]_____________________________________
timeout 0 >nul /NOBREAK


echo __[0000]_____________________________________
echo ^<127.0.0.1^>................................
echo 0   1        #
echo 1 1  1       #
echo 2   0        #
echo 3            #
echo 4 0   11  1  #         XXXXXXX
echo 5       1    #        X       X
echo 6  0 0  00 00#       X         X
echo 7     00  0  #      X           X
echo 8            #       X         X
echo 9          1 #        X       X
echo a            #         XXXXXXX
echo b            #
echo c            #
echo d            #
echo e  1     1   #
echo f           1#
echo .................................^<no-server^>
echo __[xxxx]_____________________________________
timeout 0 >nul /NOBREAK

echo __[0000]_____________________________________
echo ^<127.0.0.1^>................................
echo 0   1        #
echo 1 1  1       #
echo 2   0        #
echo 3            #
echo 4 0   11  1  #         XXXXXXX
echo 5       1    #        X       X
echo 6  0 0  00 000       X         X
echo 7     00  0  #      X           X
echo 8            #       X         X
echo 9          1 #        X       X
echo a            #         XXXXXXX
echo b            #
echo c            #
echo d            #
echo e  1     1   1
echo f           1#
echo .................................^<no-server^>
echo __[xxxx]_____________________________________
timeout 0 >nul /NOBREAK

echo __[0000]_____________________________________
echo ^<127.0.0.1^>................................
echo 0   1         1
echo 1 1  1        #
echo 2   0         0
echo 3             #
echo 4 0   11  1   #        XXXXXXX
echo 5       1     #       X       X
echo 6  0 0  00 000#      X         X
echo 7     00  0   #     X           X
echo 8             #      X         X
echo 9          1  #       X       X
echo a             #        XXXXXXX
echo b             #
echo c             #
echo d             #
echo e  1     1   1#
echo f           1 #
echo .................................^<no-server^>
echo __[xxxx]_____________________________________
timeout 0 >nul /NOBREAK

echo __[0000]_____________________________________
echo ^<127.0.0.1^>................................
echo 0   1         1#
echo 1 1  1         #
echo 2   0         0#
echo 3              1
echo 4 0   11  1    #       XXXXXXX
echo 5       1      #      X       X
echo 6  0 0  00 000 #     X         X
echo 7     00  0    0    X           X
echo 8              #     X         X
echo 9          1   #      X       X
echo a              #       XXXXXXX
echo b              #
echo c              #
echo d              #
echo e  1     1   1 #
echo f           1  #
echo .................................^<no-server^>
echo __[xxxx]_____________________________________
timeout 0 >nul /NOBREAK

echo __[0000]_____________________________________
echo ^<127.0.0.1^>................................
echo 0   1         1#
echo 1 1  1         #
echo 2   0         0#
echo 3              1
echo 4 0   11  1    #       XXXXXXX
echo 5       1      #      X       X
echo 6  0 0  00 000 #     X         X
echo 7     00  0    0    X           X
echo 8              #     X         X
echo 9          1   #      X       X
echo a              #       XXXXXXX
echo b              #
echo c              #
echo d              #
echo e  1     1   1 #
echo f           1  #
echo .................................^<no-server^>
echo __[xxxx]_____________________________________
timeout 0 >nul /NOBREAK

echo __[0000]_____________________________________
echo ^<127.0.0.1^>................................
echo 0   1         1 #
echo 1 1  1          #
echo 2   0         0 #
echo 3              1#
echo 4 0   11  1     #      XXXXXXX
echo 5       1       1     X       X
echo 6  0 0  00 000  0    X         X
echo 7     00  0    0#   X           X
echo 8               #    X         X
echo 9          1    #     X       X
echo a               #      XXXXXXX
echo b               #
echo c               #
echo d               #
echo e  1     1   1  #
echo f           1   #
echo .................................^<no-server^>
echo __[xxxx]_____________________________________
timeout 0 >nul /NOBREAK

echo __[0000]_____________________________________
echo ^<127.0.0.1^>................................
echo 0   1         1  #
echo 1 1  1           #
echo 2   0         0  #
echo 3              1 #
echo 4 0   11  1      #     XXXXXXX
echo 5       1       11    X       X
echo 6  0 0  00 000  00   X         X
echo 7     00  0    0 #  X           X
echo 8                #   X         X
echo 9          1     #    X       X
echo a                #     XXXXXXX
echo b                #
echo c                #
echo d                #
echo e  1     1   1   #
echo f           1    #
echo .................................^<no-server^>
echo __[xxxx]_____________________________________
timeout 0 >nul /NOBREAK

echo __[0000]_____________________________________
echo ^<127.0.0.1^>................................
echo 0   1         1   #
echo 1 1  1            #
echo 2   0         0   #
echo 3              1  #
echo 4 0   11  1       #    XXXXXXX
echo 5       1       11#   X       X
echo 6  0 0  00 000  000  X         X
echo 7     00  0    0  # X           X
echo 8                 #  X         X
echo 9          1      #   X       X
echo a                 #    XXXXXXX
echo b                 1
echo c                 #
echo d                 #
echo e  1     1   1    #
echo f           1     #
echo .................................^<no-server^>
echo __[xxxx]_____________________________________
timeout 0 >nul /NOBREAK

echo __[0000]_____________________________________
echo ^<127.0.0.1^>................................
echo 0   1         1    #
echo 1 1  1             #
echo 2   0         0    #
echo 3              1   #
echo 4 0   11  1        #   XXXXXXX
echo 5       1       11 1  X       X
echo 6  0 0  00 000  0000 X         X
echo 7     00  0    0   #X           X
echo 8                  # X         X
echo 9          1       #  X       X
echo a                  #   XXXXXXX
echo b                 1#
echo c                  #
echo d                  #
echo e  1     1   1     #
echo f           1      #
echo .................................^<no-server^>
echo __[xxxx]_____________________________________
timeout 0 >nul /NOBREAK

echo __[0000]_____________________________________
echo ^<127.0.0.1^>................................
echo 0   1         1     #
echo 1 1  1              #
echo 2   0         0     1
echo 3              1    #
echo 4 0   11  1         #  XXXXXXX
echo 5       1       11 1# X       X
echo 6  0 0  00 000  0000#X         X
echo 7     00  0    0    0           X
echo 8                   #X         X
echo 9          1        # X       X
echo a                   #  XXXXXXX
echo b                 1 #
echo c                   #
echo d                   #
echo e  1     1   1      #
echo f           1       #
echo .................................^<no-server^>
echo __[xxxx]_____________________________________
timeout 0 >nul /NOBREAK

echo __[0000]_____________________________________
echo ^<127.0.0.1^>................................
echo 0   1         1      #
echo 1 1  1               #
echo 2   0         0     1#
echo 3              1     0
echo 4 0   11  1          # XXXXXXX
echo 5       1       11 1 #X       X
echo 6  0 0  00 000  0000 #         X
echo 7     00  0    0    0#          X
echo 8                    #         X
echo 9          1         #X       X
echo a                    # XXXXXXX
echo b                 1  1
echo c                    #
echo d                    #
echo e  1     1   1       #
echo f           1        #
echo .................................^<no-server^>
echo __[xxxx]_____________________________________
timeout 0 >nul /NOBREAK

echo __[0000]_____________________________________
echo ^<127.0.0.1^>................................
echo 0   1         1       #
echo 1 1  1                #
echo 2   0         0     1 #
echo 3              1     0#
echo 4 0   11  1           #XXXXXXX
echo 5       1       11 1  #       X
echo 6  0 0  00 000  0000  #        X
echo 7     00  0    0    0 #         X
echo 8                     #        X
echo 9          1          #       X
echo a                     #XXXXXXX
echo b                 1  1#
echo c                     #
echo d                     #
echo e  1     1   1        #
echo f           1         #
echo .................................^<no-server^>
echo __[xxxx]_____________________________________
timeout 0 >nul /NOBREAK

echo __[0000]_____________________________________
echo ^<127.0.0.1^>................................
echo 0   1         1       1
echo 1 1  1                #
echo 2   0         0     1 0
echo 3              1     0#
echo 4 0   11  1           #XXXXXXX
echo 5       1       11 1  #       X
echo 6  0 0  00 000  0000  #        X
echo 7     00  0    0    0 #         X
echo 8                     #        X
echo 9          1          #       X
echo a                     #XXXXXXX
echo b                 1  1#
echo c                     #
echo d                     #
echo e  1     1   1        #
echo f           1         #
echo .................................^<no-server^>
echo __[xxxx]_____________________________________
timeout 0 >nul /NOBREAK

echo __[0000]_____________________________________
echo ^<127.0.0.1^>................................
echo 0   1         1       1#
echo 1 1  1                 #
echo 2   0         0     1 0#
echo 3              1     0 #
echo 4 0   11  1            1XXXXXX
echo 5       1       11 1   #      X
echo 6  0 0  00 000  0000   #       X
echo 7     00  0    0    0  0        X
echo 8                      #       X
echo 9          1           #      X
echo a                      #XXXXXX
echo b                 1  1 #
echo c                      #
echo d                      #
echo e  1     1   1         #
echo f           1          #
echo .................................^<no-server^>
echo __[xxxx]_____________________________________
timeout 0 >nul /NOBREAK

echo __[0000]_____________________________________
echo ^<127.0.0.1^>................................
echo 0   1         1       1 #
echo 1 1  1                  #
echo 2   0         0     1 0 #
echo 3              1     0  #
echo 4 0   11  1            1#XXXXX
echo 5       1       11 1    #     X
echo 6  0 0  00 000  0000    0      X
echo 7     00  0    0    0  0#       X
echo 8                       1      X
echo 9          1            #     X
echo a                       #XXXXX
echo b                 1  1  #
echo c                       #
echo d                       #
echo e  1     1   1          #
echo f           1           #
echo .................................^<no-server^>
echo __[xxxx]_____________________________________
timeout 0 >nul /NOBREAK

echo __[0000]_____________________________________
echo ^<127.0.0.1^>................................
echo 0   1         1       1  #
echo 1 1  1                   1
echo 2   0         0     1 0  #
echo 3              1     0   #
echo 4 0   11  1            1 #XXXX
echo 5       1       11 1     #    X
echo 6  0 0  00 000  0000    00     X
echo 7     00  0    0    0  0 #      X
echo 8                       1#     X
echo 9          1             #    X
echo a                        #XXXX
echo b                 1  1   #
echo c                        #
echo d                        #
echo e  1     1   1           #
echo f           1            #
echo .................................^<no-server^>
echo __[xxxx]_____________________________________
timeout 0 >nul /NOBREAK

echo __[0000]_____________________________________
echo ^<127.0.0.1^>................................
echo 0   1         1       1   #
echo 1 1  1                   1#
echo 2   0         0     1 0   #
echo 3              1     0    #
echo 4 0   11  1            1  1XXX
echo 5       1       11 1      #   X
echo 6  0 0  00 000  0000    00#    X
echo 7     00  0    0    0  0  0     X
echo 8                       1 #    X
echo 9          1              #   X
echo a                         #XXX
echo b                 1  1    #
echo c                         #
echo d                         #
echo e  1     1   1            #
echo f           1             #
echo .................................^<no-server^>
echo __[xxxx]_____________________________________
timeout 0 >nul /NOBREAK


echo __[0000]_____________________________________
echo ^<127.0.0.1^>................................
echo 0   1         1       1    #
echo 1 1  1                   1 #
echo 2   0         0     1 0    0
echo 3              1     0     #
echo 4 0   11  1            1  1#XX
echo 5       1       11 1       #  X
echo 6  0 0  00 000  0000    00 #   X
echo 7     00  0    0    0  0  01    X
echo 8                       1  #   X
echo 9          1               #  X
echo a                          #XX
echo b                 1  1     #
echo c                          #
echo d                          #
echo e  1     1   1             #
echo f           1              #
echo .................................^<no-server^>
echo __[xxxx]_____________________________________
timeout 0 >nul /NOBREAK


echo __[0000]_____________________________________
echo ^<127.0.0.1^>................................
echo 0   1         1       1     #
echo 1 1  1                   1  #
echo 2   0         0     1 0    0#
echo 3              1     0      1
echo 4 0   11  1            1  1 #X
echo 5       1       11 1        # X
echo 6  0 0  00 000  0000    00  #  X
echo 7     00  0    0    0  0  010   X
echo 8                       1   #  X
echo 9          1                # X
echo a                           #X
echo b                 1  1      #
echo c                           #
echo d                           #
echo e  1     1   1              #
echo f           1               #
echo .................................^<no-server^>
echo __[xxxx]_____________________________________
timeout 0 >nul /NOBREAK

echo __[0000]_____________________________________
echo ^<127.0.0.1^>................................
echo 0   1         1       1      1
echo 1 1  1                   1   #
echo 2   0         0     1 0    0 0
echo 3              1     0      1#
echo 4 0   11  1            1  1  #
echo 5       1       11 1         #X
echo 6  0 0  00 000  0000    00   # X
echo 7     00  0    0    0  0  010#  X
echo 8                       1    # X
echo 9          1                 #X
echo a                            #
echo b                 1  1       #
echo c                            #
echo d                            #
echo e  1     1   1               #
echo f           1                #
echo .................................^<no-server^>
echo __[xxxx]_____________________________________
timeout 0 >nul /NOBREAK

echo __[0000]_____________________________________
echo ^<127.0.0.1^>................................
echo 0   1         1       1      1#
echo 1 1  1                   1    #
echo 2   0         0     1 0    0 0#
echo 3              1     0      1 #
echo 4 0   11  1            1  1   #
echo 5       1       11 1          #
echo 6  0 0  00 000  0000    00    #X
echo 7     00  0    0    0  0  010 wX
echo 8                       1     #X
echo 9          1                  #
echo a                             #
echo b                 1  1        #
echo c                             #
echo d                             #
echo e  1     1   1                #
echo f           1                 #
echo .................................^<no-server^>
echo __[xxxx]_____________________________________
timeout 0 >nul /NOBREAK

echo __[0000]_____________________________________
echo ^<127.0.0.1^>................................
echo 0   1         1       1      1 #
echo 1 1  1                   1     #
echo 2   0         0     1 0    0 0 #
echo 3              1     0      1  #
echo 4 0   11  1            1  1    #
echo 5       1       11 1           #
echo 6  0 0  00 000  0000    00     0
echo 7     00  0    0    0  0  010 w#
echo 8                       1      1
echo 9          1                   #
echo a                              #
echo b                 1  1         #
echo c                              #
echo d                              #
echo e  1     1   1                 #
echo f           1                  #
echo .................................^<no-server^>
echo __[xxxx]_____________________________________
timeout 0 >nul /NOBREAK

echo __[0000]_____________________________________
echo ^<127.0.0.1^>................................
echo 0   1         1       1      1  #
echo 1 1  1                   1      1
echo 2   0         0     1 0    0 0  #
echo 3              1     0      1   #
echo 4 0   11  1            1  1     #
echo 5       1       11 1            #
echo 6  0 0  00 000  0000    00     00
echo 7     00  0    0    0  0  010 w #
echo 8                       1      1#
echo 9          1                    #
echo a                               #
echo b                 1  1          #
echo c                               #
echo d                               #
echo e  1     1   1                  #
echo f           1                   #
echo .................................^<no-server^>
echo __[xxxx]_____________________________________
timeout 0 >nul /NOBREAK

echo __[0000]_____________________________________
echo ^<127.0.0.1^>................................
echo 0   1         1       1      1   #
echo 1 1  1                   1      1#
echo 2   0         0     1 0    0 0   #
echo 3              1     0      1    #
echo 4 0   11  1            1  1      1
echo 5       1       11 1             #
echo 6  0 0  00 000  0000    00     00#
echo 7     00  0    0    0  0  010 w  0
echo 8                       1      1 #
echo 9          1                     #
echo a                                #
echo b                 1  1           #
echo c                                #
echo d                                #
echo e  1     1   1                   #
echo f           1                    #
echo .................................^<no-server^>
echo __[xxxx]_____________________________________
timeout 0 >nul /NOBREAK

echo __[0000]_____________________________________
echo ^<127.0.0.1^>................................
echo 0   1         1       1      1    1
echo 1 1  1                   1      1 #
echo 2   0         0     1 0    0 0    0
echo 3              1     0      1     #
echo 4 0   11  1            1  1      1#
echo 5       1       11 1              #
echo 6  0 0  00 000  0000    00     00 #
echo 7     00  0    0    0  0  010 w  0#
echo 8                       1      1  #
echo 9          1                      #
echo a                                 #
echo b                 1  1            #
echo c                                 #
echo d                                 #
echo e  1     1   1                    #
echo f           1                     #
echo .................................^<no-server^>
echo __[xxxx]_____________________________________
timeout 0 >nul /NOBREAK

echo __[0000]_____________________________________
echo ^<127.0.0.1^>................................
echo 0   1         1       1      1    1#
echo 1 1  1                   1      1  #
echo 2   0         0     1 0    0 0    0#
echo 3              1     0      1      1
echo 4 0   11  1            1  1      1 #
echo 5       1       11 1               #
echo 6  0 0  00 000  0000    00     00  #
echo 7     00  0    0    0  0  010 w  0 0
echo 8                       1      1   #
echo 9          1                       #
echo a                                  #
echo b                 1  1             #
echo c                                  #
echo d                                  #
echo e  1     1   1                     #
echo f           1                      #
echo .................................^<no-server^>
echo __[xxxx]_____________________________________
timeout 0 >nul /NOBREAK

echo __[0000]_____________________________________
echo ^<127.0.0.1^>................................
echo 0   1         1       1      1    1 #
echo 1 1  1                   1      1   #
echo 2   0         0     1 0    0 0    0 #
echo 3              1     0      1      1#
echo 4 0   11  1            1  1      1  #
echo 5       1       11 1                #
echo 6  0 0  00 000  0000    00     00   0
echo 7     00  0    0    0  0  010 w  0 0#
echo 8                       1      1    1
echo 9          1                        #
echo a                                   #
echo b                 1  1              #
echo c                                   #
echo d                                   #
echo e  1     1   1                      #
echo f           1                       #
echo .................................^<no-server^>
echo __[xxxx]_____________________________________
timeout 0 >nul /NOBREAK

echo __[0000]_____________________________________
echo ^<127.0.0.1^>................................
echo 0   1         1       1      1    1  #
echo 1 1  1                   1      1    #
echo 2   0         0     1 0    0 0    0  #
echo 3              1     0      1      1 #
echo 4 0   11  1            1  1      1   #
echo 5       1       11 1                 1
echo 6  0 0  00 000  0000    00     00   00
echo 7     00  0    0    0  0  010 w  0 0 #
echo 8                       1      1    1#
echo 9          1                         #
echo a                                    #
echo b                 1  1               #
echo c                                    #
echo d                                    #
echo e  1     1   1                       #
echo f           1                        #
echo .................................^<no-server^>
echo __[xxxx]_____________________________________
timeout 0 >nul /NOBREAK

echo __[0000]_____________________________________
echo ^<127.0.0.1^>................................
echo 0   1         1       1      1    1   1
echo 1 1  1                   1      1     #
echo 2   0         0     1 0    0 0    0   0
echo 3              1     0      1      1  #
echo 4 0   11  1            1  1      1    #
echo 5       1       11 1                 1#
echo 6  0 0  00 000  0000    00     00   00#
echo 7     00  0    0    0  0  010 w  0 0  #
echo 8                       1      1    1 #
echo 9          1                          #
echo a                                     #
echo b                 1  1                #
echo c                                     #
echo d                                     #
echo e  1     1   1                        #
echo f           1                         #
echo .................................^<no-server^>
echo __[xxxx]_____________________________________
timeout 0 >nul /NOBREAK

echo __[0000]_____________________________________
echo ^<127.0.0.1^>................................
echo 0   1         1       1      1    1   1#
echo 1 1  1                   1      1      #
echo 2   0         0     1 0    0 0    0   0#
echo 3              1     0      1      1   #
echo 4 0   11  1            1  1      1     1
echo 5       1       11 1                 1 #
echo 6  0 0  00 000  0000    00     00   00 #
echo 7     00  0    0    0  0  010 w  0 0   0
echo 8                       1      1    1  #
echo 9          1                           #
echo a                                      #
echo b                 1  1                 #
echo c                                      #
echo d                                      #
echo e  1     1   1                         #
echo f           1                          #
echo .................................^<no-server^>
echo __[xxxx]_____________________________________
timeout 0 >nul /NOBREAK

echo __[0000]_____________________________________
echo ^<127.0.0.1^>................................
echo 0   1         1       1      1    1   1 #
echo 1 1  1                   1      1       #
echo 2   0         0     1 0    0 0    0   0 #
echo 3              1     0      1      1    #
echo 4 0   11  1            1  1      1     1#
echo 5       1       11 1                 1  #
echo 6  0 0  00 000  0000    00     00   00  0
echo 7     00  0    0    0  0  010 w  0 0   0#
echo 8                       1      1    1   1
echo 9          1                            #
echo a                                       #
echo b                 1  1                  #
echo c                                       #
echo d                                       #
echo e  1     1   1                          #
echo f           1                           #
echo .................................^<no-server^>
echo __[xxxx]_____________________________________
timeout 0 >nul /NOBREAK

echo __[0000]_____________________________________
echo ^<127.0.0.1^>................................
echo 0   1         1       1      1    1   1  #
echo 1 1  1                   1      1        #
echo 2   0         0     1 0    0 0    0   0  #
echo 3              1     0      1      1     #
echo 4 0   11  1            1  1      1     1 #
echo 5       1       11 1                 1   #
echo 6  0 0  00 000  0000    00     00   00  00
echo 7     00  0    0    0  0  010 w  0 0   0 #
echo 8                       1      1    1   1#
echo 9          1                             1
echo a                                        #
echo b                 1  1                   #
echo c                                        #
echo d                                        #
echo e  1     1   1                           #
echo f           1                            #
echo .................................^<no-server^>
echo __[xxxx]_____________________________________
timeout 0 >nul /NOBREAK

echo __[0000]_____________________________________
echo ^<127.0.0.1^>................................
echo 0   1         1       1      1    1   1   #
echo 1 1  1                   1      1         #
echo 2   0         0     1 0    0 0    0   0   #
echo 3              1     0      1      1      #
echo 4 0   11  1            1  1      1     1  #
echo 5       1       11 1                 1    #
echo 6  0 0  00 000  0000    00     00   00  000
echo 7     00  0    0    0  0  010 w  0 0   0  #
echo 8                       1      1    1   1 #
echo 9          1                             1#
echo a                                         #
echo b                 1  1                    #
echo c                                         #
echo d                                         #
echo e  1     1   1                            1
echo f           1                             #
echo .................................^<no-server^>
echo __[xxxx]_____________________________________
timeout 0 >nul /NOBREAK

echo __[0000]_____________________________________
echo ^<127.0.0.1^>................................
echo 0   1         1       1      1    1   1    #
echo 1 1  1                   1      1          #
echo 2   0         0     1 0    0 0    0   0    #
echo 3              1     0      1      1       #
echo 4 0   11  1            1  1      1     1   #
echo 5       1       11 1                 1     #
echo 6  0 0  00 000  0000    00     00   00  0000
echo 7     00  0    0    0  0  010 w  0 0   0   #
echo 8                       1      1    1   1  #
echo 9          1                             1 #
echo a                                          #
echo b                 1  1                     1
echo c                                          #
echo d                                          #
echo e  1     1   1                            1#
echo f           1                              #
echo .................................^<no-server^>
echo __[xxxx]_____________________________________
timeout 0 >nul /NOBREAK

echo __[0000]_____________________________________
echo ^<127.0.0.1^>................................
echo 0   1         1       1      1    1   1     #
echo 1 1  1                   1      1           #
echo 2   0         0     1 0    0 0    0   0     #
echo 3              1     0      1      1        1
echo 4 0   11  1            1  1      1     1    #
echo 5       1       11 1                 1      #
echo 6  0 0  00 000  0000    00     00   00  0000#
echo 7     00  0    0    0  0  010 w  0 0   0    0
echo 8                       1      1    1   1   #
echo 9          1                             1  #
echo a                                           #
echo b                 1  1                     1#
echo c                                           #
echo d                                           #
echo e  1     1   1                            1 #
echo f           1                               #
echo .................................^<no-server^>
echo __[xxxx]_____________________________________
timeout 0 >nul /NOBREAK

echo __[0000]_____________________________________
echo ^<127.0.0.1^>................................
echo 0   1         1       1      1    1   1      1
echo 1 1  1                   1      1            #
echo 2   0         0     1 0    0 0    0   0      0
echo 3              1     0      1      1        1#
echo 4 0   11  1            1  1      1     1     #
echo 5       1       11 1                 1       #
echo 6  0 0  00 000  0000    00     00   00  0000 #
echo 7     00  0    0    0  0  010 w  0 0   0    0#
echo 8                       1      1    1   1    #
echo 9          1                             1   #
echo a                                            #
echo b                 1  1                     1 #
echo c                                            #
echo d                                            #
echo e  1     1   1                            1  #
echo f           1                                #
echo .................................^<no-server^>
echo __[xxxx]_____________________________________
timeout 0 >nul /NOBREAK

echo __[0000]_____________________________________
echo ^<127.0.0.1^>................................
echo 0   1         1       1      1    1   1      1#
echo 1 1  1                   1      1             #
echo 2   0         0     1 0    0 0    0   0      0#
echo 3              1     0      1      1        1 #
echo 4 0   11  1            1  1      1     1      0
echo 5       1       11 1                 1        #
echo 6  0 0  00 000  0000    00     00   00  0000  #
echo 7     00  0    0    0  0  010 w  0 0   0    0 #
echo 8                       1      1    1   1     #
echo 9          1                             1    1
echo a                                             #
echo b                 1  1                     1  #
echo c                                             #
echo d                                             #
echo e  1     1   1                            1   #
echo f           1                                 #
echo .................................^<no-server^>
echo __[xxxx]_____________________________________
timeout 0 >nul /NOBREAK

echo __[0000]_____________________________________
echo ^<127.0.0.1^>................................
echo 0   1         1       1      1    1   1      1 1
echo 1 1  1                   1      1              #
echo 2   0         0     1 0    0 0    0   0      0 0
echo 3              1     0      1      1        1  #
echo 4 0   11  1            1  1      1     1      0#
echo 5       1       11 1                 1         #
echo 6  0 0  00 000  0000    00     00   00  0000   #
echo 7     00  0    0    0  0  010 w  0 0   0    0  #
echo 8                       1      1    1   1      #
echo 9          1                             1    1#
echo a                                              #
echo b                 1  1                     1   #
echo c                                              #
echo d                                              #
echo e  1     1   1                            1    #
echo f           1                                  #
echo .................................^<no-server^>
echo __[xxxx]_____________________________________
timeout 0 >nul /NOBREAK

echo __[0000]_____________________________________
echo ^<127.0.0.1^>................................
echo 0   1         1       1      1    1   1      1 1#
echo 1 1  1                   1      1               1
echo 2   0         0     1 0    0 0    0   0      0 0#
echo 3              1     0      1      1        1   #
echo 4 0   11  1            1  1      1     1      0 #
echo 5       1       11 1                 1          #
echo 6  0 0  00 000  0000    00     00   00  0000    0
echo 7     00  0    0    0  0  010 w  0 0   0    0   #
echo 8                       1      1    1   1       #
echo 9          1                             1    1 #
echo a                                               #
echo b                 1  1                     1    #
echo c                                               #
echo d                                               #
echo e  1     1   1                            1     #
echo f           1                                   #
echo .................................^<no-server^>
echo __[xxxx]_____________________________________
timeout 0 >nul /NOBREAK

echo __[0000]_____________________________________
echo ^<127.0.0.1^>................................
echo 0   1         1       1      1    1   1      1 1 #
echo 1 1  1                   1      1               1#
echo 2   0         0     1 0    0 0    0   0      0 0 #
echo 3              1     0      1      1        1    #
echo 4 0   11  1            1  1      1     1      0  #
echo 5       1       11 1                 1           #
echo 6  0 0  00 000  0000    00     00   00  0000    00
echo 7     00  0    0    0  0  010 w  0 0   0    0    #
echo 8                       1      1    1   1        #
echo 9          1                             1    1  #
echo a                                                #
echo b                 1  1                     1     #
echo c                                                #
echo d                                                1
echo e  1     1   1                            1      #
echo f           1                                    #
echo .................................^<no-server^>
echo __[xxxx]_____________________________________
timeout 0 >nul /NOBREAK

echo __[0000]_____________________________________
echo ^<127.0.0.1^>................................
echo 0   1         1       1      1    1   1      1 1  1
echo 1 1  1                   1      1               1 #
echo 2   0         0     1 0    0 0    0   0      0 0  0
echo 3              1     0      1      1        1     #
echo 4 0   11  1            1  1      1     1      0   #
echo 5       1       11 1                 1            #
echo 6  0 0  00 000  0000    00     00   00  0000    00#
echo 7     00  0    0    0  0  010 w  0 0   0    0     #
echo 8                       1      1    1   1         #
echo 9          1                             1    1   #
echo a                                                 #
echo b                 1  1                     1      #
echo c                                                 #
echo d                                                1#
echo e  1     1   1                            1       #
echo f           1                                     #
echo .................................^<no-server^>
echo __[xxxx]_____________________________________
timeout 0 >nul /NOBREAK

echo __[0000]_____________________________________
echo ^<127.0.0.1^>................................
echo 0   1         1       1      1    1   1      1 1  1#
echo 1 1  1                   1      1               1  #
echo 2   0         0     1 0    0 0    0   0      0 0  0#
echo 3              1     0      1      1        1      0
echo 4 0   11  1            1  1      1     1      0    #
echo 5       1       11 1                 1             #
echo 6  0 0  00 000  0000    00     00   00  0000    00 #
echo 7     00  0    0    0  0  010 w  0 0   0    0      #
echo 8                       1      1    1   1          #
echo 9          1                             1    1    #
echo a                                                  1
echo b                 1  1                     1       #
echo c                                                  #
echo d                                                1 #
echo e  1     1   1                            1        #
echo f           1                                      #
echo .................................^<no-server^>
echo __[xxxx]_____________________________________
timeout 0 >nul /NOBREAK

echo __[0000]_____________________________________
echo ^<127.0.0.1^>................................
echo 0   1         1       1      1    1   1      1 1  1 #
echo 1 1  1                   1      1               1   #
echo 2   0         0     1 0    0 0    0   0      0 0  0 0
echo 3              1     0      1      1        1      0#
echo 4 0   11  1            1  1      1     1      0     #
echo 5       1       11 1                 1              #
echo 6  0 0  00 000  0000    00     00   00  0000    00  #
echo 7     00  0    0    0  0  010 w  0 0   0    0       #
echo 8                       1      1    1   1           1
echo 9          1                             1    1     #
echo a                                                  1#
echo b                 1  1                     1        #
echo c                                                   #
echo d                                                1  #
echo e  1     1   1                            1         #
echo f           1                                       #
echo .................................^<no-server^>
echo __[xxxx]_____________________________________
timeout 0 >nul /NOBREAK

echo __[0000]_____________________________________
echo ^<127.0.0.1^>................................
echo 0   1         1       1      1    1   1      1 1  1  #
echo 1 1  1                   1      1               1    #
echo 2   0         0     1 0    0 0    0   0      0 0  0 0#
echo 3              1     0      1      1        1      0 #
echo 4 0   11  1            1  1      1     1      0      #
echo 5       1       11 1                 1               #
echo 6  0 0  00 000  0000    00     00   00  0000    00   #
echo 7     00  0    0    0  0  010 w  0 0   0    0        #
echo 8                       1      1    1   1           1#
echo 9          1                             1    1      #
echo a                                                  1 #
echo b                 1  1                     1         #
echo c                                                    #
echo d                                                1   #
echo e  1     1   1                            1          #
echo f           1                                        #
echo .................................^<no-server^>
echo __[xxxx]_____________________________________
timeout 0 >nul /NOBREAK

rem hash empty
:dropdown

echo __[0000]_____________________________________
echo ^<127.0.0.1^>................................
echo 0   1         1       1      1    1   1      1 1  1  
echo 1 1  1                   1      1               1    
echo 2   0         0     1 0    0 0    0   0      0 0  0 0
echo 3              1     0      1      1        1      0 
echo 4 0   11  1            1  1      1     1      0      
echo 5       1       11 1                 1               
echo 6  0 0  00 000  0000    00     00   00  0000    00   
echo 7     00  0    0    0  0  010 w  0 0   0    0        
echo 8                       1      1    1   1           1
echo 9          1                             1    1      
echo a                                                  1 
echo b                 1  1                     1         
echo c                                                    
echo d                                                1   
echo e  1     1   1                            1          
echo f           1                                        
echo .................................^<no-server^>
echo __[xxxx]_____________________________________
timeout 2 >nul /NOBREAK


echo __[0000]_____________________________________
echo ^<127.0.0.1^>................................
echo ----------------------------------------------------  
echo 1 1  1                   1      1               1    
echo 2   0         0     1 0    0 0    0   0      0 0  0 0
echo 3              1     0      1      1        1      0 
echo 4 0   11  1            1  1      1     1      0      
echo 5       1       11 1                 1               
echo 6  0 0  00 000  0000    00     00   00  0000    00   
echo 7     00  0    0    0  0  010 w  0 0   0    0        
echo 8                       1      1    1   1           1
echo 9          1                             1    1      
echo a                                                  1 
echo b                 1  1                     1         
echo c                                                    
echo d                                                1   
echo e  1     1   1                            1          
echo f           1                                        
echo .................................^<no-server^>
echo __[xxxx]_____________________________________
REM timeout 0 >nul /NOBREAK
cls

echo __[0000]_____________________________________
echo ^<127.0.0.1^>................................
echo.
echo ----------------------------------------------------  
echo 2   0         0     1 0    0 0    0   0      0 0  0 0
echo 3              1     0      1      1        1      0 
echo 4 0   11  1            1  1      1     1      0      
echo 5       1       11 1                 1               
echo 6  0 0  00 000  0000    00     00   00  0000    00   
echo 7     00  0    0    0  0  010 w  0 0   0    0        
echo 8                       1      1    1   1           1
echo 9          1                             1    1      
echo a                                                  1 
echo b                 1  1                     1         
echo c                                                    
echo d                                                1   
echo e  1     1   1                            1          
echo f           1                                        
echo .................................^<no-server^>
echo __[xxxx]_____________________________________
REM timeout 0 >nul /NOBREAK
cls

echo __[0000]_____________________________________
echo ^<127.0.0.1^>................................
echo.
echo.
echo ----------------------------------------------------  
echo 3              1     0      1      1        1      0 
echo 4 0   11  1            1  1      1     1      0      
echo 5       1       11 1                 1               
echo 6  0 0  00 000  0000    00     00   00  0000    00   
echo 7     00  0    0    0  0  010 w  0 0   0    0        
echo 8                       1      1    1   1           1
echo 9          1                             1    1      
echo a                                                  1 
echo b                 1  1                     1         
echo c                                                    
echo d                                                1   
echo e  1     1   1                            1          
echo f           1                                        
echo .................................^<no-server^>
echo __[xxxx]_____________________________________
REM timeout 0 >nul /NOBREAK
cls

echo __[0000]_____________________________________
echo ^<127.0.0.1^>................................
echo.
echo.
echo.
echo ----------------------------------------------------  
echo 4 0   11  1            1  1      1     1      0      
echo 5       1       11 1                 1               
echo 6  0 0  00 000  0000    00     00   00  0000    00   
echo 7     00  0    0    0  0  010 w  0 0   0    0        
echo 8                       1      1    1   1           1
echo 9          1                             1    1      
echo a                                                  1 
echo b                 1  1                     1         
echo c                                                    
echo d                                                1   
echo e  1     1   1                            1          
echo f           1                                        
echo .................................^<no-server^>
echo __[xxxx]_____________________________________
REM timeout 0 >nul /NOBREAK
cls

echo __[0000]_____________________________________
echo ^<127.0.0.1^>................................
echo.
echo.
echo.
echo.
echo ----------------------------------------------------  
echo 5       1       11 1                 1               
echo 6  0 0  00 000  0000    00     00   00  0000    00   
echo 7     00  0    0    0  0  010 w  0 0   0    0        
echo 8                       1      1    1   1           1
echo 9          1                             1    1      
echo a                                                  1 
echo b                 1  1                     1         
echo c                                                    
echo d                                                1   
echo e  1     1   1                            1          
echo f           1                                        
echo .................................^<no-server^>
echo __[xxxx]_____________________________________
REM timeout 0 >nul /NOBREAK
cls

echo __[0000]_____________________________________
echo ^<127.0.0.1^>................................
echo.
echo.
echo.
echo.
echo.
echo ----------------------------------------------------  
echo 6  0 0  00 000  0000    00     00   00  0000    00   
echo 7     00  0    0    0  0  010 w  0 0   0    0        
echo 8                       1      1    1   1           1
echo 9          1                             1    1      
echo a                                                  1 
echo b                 1  1                     1         
echo c                                                    
echo d                                                1   
echo e  1     1   1                            1          
echo f           1                                        
echo .................................^<no-server^>
echo __[xxxx]_____________________________________
REM timeout 0 >nul /NOBREAK
cls

echo __[0000]_____________________________________
echo ^<127.0.0.1^>................................
echo.
echo.
echo.
echo.
echo.
echo.
echo ----------------------------------------------------  
echo 7     00  0    0    0  0  010 w  0 0   0    0        
echo 8                       1      1    1   1           1
echo 9          1                             1    1      
echo a                                                  1 
echo b                 1  1                     1         
echo c                                                    
echo d                                                1   
echo e  1     1   1                            1          
echo f           1                                        
echo .................................^<no-server^>
echo __[xxxx]_____________________________________
REM timeout 0 >nul /NOBREAK
cls

echo __[0000]_____________________________________
echo ^<127.0.0.1^>................................
echo.
echo.
echo.
echo.
echo.
echo.
echo.
echo ----------------------------------------------------  
echo 8                       1      1    1   1           1
echo 9          1                             1    1      
echo a                                                  1 
echo b                 1  1                     1         
echo c                                                    
echo d                                                1   
echo e  1     1   1                            1          
echo f           1                                        
echo .................................^<no-server^>
echo __[xxxx]_____________________________________
REM timeout 0 >nul /NOBREAK
cls

echo __[0000]_____________________________________
echo ^<127.0.0.1^>................................
echo.
echo.
echo.
echo.
echo.
echo.
echo.
echo.
echo ----------------------------------------------------  
echo 9          1                             1    1      
echo a                                                  1 
echo b                 1  1                     1         
echo c                                                    
echo d                                                1   
echo e  1     1   1                            1          
echo f           1                                        
echo .................................^<no-server^>
echo __[xxxx]_____________________________________
REM timeout 0 >nul /NOBREAK

REM cls
goto scclear

echo __[0000]_____________________________________
echo ^<127.0.0.1^>................................
echo.
echo.
echo.
echo.
echo.
echo.
echo.
echo.
echo.
echo ----------------------------------------------------  
echo a                                                  1 
echo b                 1  1                     1         
echo c                                                    
echo d                                                1   
echo e  1     1   1                            1          
echo f           1                                        
echo .................................^<no-server^>
echo __[xxxx]_____________________________________
REM timeout 0 >nul /NOBREAK
cls

echo __[0000]_____________________________________
echo ^<127.0.0.1^>................................
echo.
echo.
echo.
echo.
echo.
echo.
echo.
echo.
echo.
echo.
echo ----------------------------------------------------  
echo b                 1  1                     1         
echo c                                                    
echo d                                                1   
echo e  1     1   1                            1          
echo f           1                                        
echo .................................^<no-server^>
echo __[xxxx]_____________________________________
REM timeout 0 >nul /NOBREAK
cls

echo __[0000]_____________________________________
echo ^<127.0.0.1^>................................
echo.
echo.
echo.
echo.
echo.
echo.
echo.
echo.
echo.
echo.
echo.
echo ----------------------------------------------------  
echo c                                                    
echo d                                                1   
echo e  1     1   1                            1          
echo f           1                                        
echo .................................^<no-server^>
echo __[xxxx]_____________________________________
REM timeout 0 >nul /NOBREAK
cls

echo __[0000]_____________________________________
echo ^<127.0.0.1^>................................
echo.
echo.
echo.
echo.
echo.
echo.
echo.
echo.
echo.
echo.
echo.
echo.
echo ----------------------------------------------------  
echo d                                                1   
echo e  1     1   1                            1          
echo f           1                                        
echo .................................^<no-server^>
echo __[xxxx]_____________________________________
REM timeout 0 >nul /NOBREAK
cls

echo __[0000]_____________________________________
echo ^<127.0.0.1^>................................
echo.
echo.
echo.
echo.
echo.
echo.
echo.
echo.
echo.
echo.
echo.
echo.
echo.
echo ----------------------------------------------------  
echo e  1     1   1                            1          
echo f           1                                        
echo .................................^<no-server^>
echo __[xxxx]_____________________________________
REM timeout 0 >nul /NOBREAK
cls

echo __[0000]_____________________________________
echo ^<127.0.0.1^>................................
echo.
echo.
echo.
echo.
echo.
echo.
echo.
echo.
echo.
echo.
echo.
echo.
echo.
echo.
echo ----------------------------------------------------  
echo f           1                                        
echo .................................^<no-server^>
echo __[xxxx]_____________________________________
REM timeout 0 >nul /NOBREAK
cls

echo __[0000]_____________________________________
echo ^<127.0.0.1^>................................
echo.
echo.
echo.
echo.
echo.
echo.
echo.
echo.
echo.
echo.
echo.
echo.
echo.
echo.
echo.
echo ----------------------------------------------------  
echo .................................^<no-server^>
echo __[xxxx]_____________________________________
REM timeout 0 >nul /NOBREAK
cls
:scclear
echo __[0000]_____________________________________
echo ^<127.0.0.1^>................................
echo.
echo.
echo.
echo.
echo.
echo.
echo.
echo.
echo.
echo.
echo.
echo.
echo.
echo.
echo.
echo.
echo .................................^<no-server^>
echo __[xxxx]_____________________________________
REM timeout 0 >nul /NOBREAK

timeout 1 >nul /nobreak

goto exit
How to enter password?
How to change the size permanently.

L4: 'mode con' used to change console sizes
:: echo__xxxx__                                     __xxxx__
:: echo %time%................................
millisecond timeout: https://stackoverflow.com/questions/735285/how-to-wait-in-a-batch-script/735294#735294

:exit

