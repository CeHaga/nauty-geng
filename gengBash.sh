#! /bin/bash

THRESHOLD=(125 102 91 83 78 165 136 118 108 101 96 216 174 151 138 128 121 116 273 220 190 171 159 150 143 138 343 275 236 210 195 183 174 167 162 420 335 286 255 234 220 209 200 193 188 512 405 344 306 279 262 248 237 228 221 216 612 486 410 364 330 307 291 278 267 258 251 246 729 573 485 426 387 358 339 323 310 299 290 283 278 855 672 565 496 450 415 390 372 357 344 333 324 317 312 1000 784 655 574 520 478 447 426 408 393 380 369 360 353 348 1155 903 755 660 594 547 510 483 463 446 431 418 407 398 391 386 1331 1036 866 755 676 622 579 546 523 503 486 471 458 447 438 431 426 1518 1184 983 855 766 704 654 615 586 564 545 528 513 500 489 480 473 468 1728 1340 1112 965 864 790 735 690 655 630 608 589 572 557 544 533 524 517 512 1950 1512 1253 1085 970 884 822 771 730 699 675 654 635 618 603 590 579 570 563 558 2197 1701 1407 1215 1085 986 916 858 811 774 747 723 702 683 666 651 638 627 618 611 606)
T=0
for v in {10..26}
do
	for e in $(seq $v $((2*$v-6)))
	do
		echo -e "Arguments =  \"$v $e \$(Step)/10 -T${THRESHOLD[${T}]}\"" >> geng.sub
		echo -e "Output =  \"out/${v}_${e}_\$(Step).out\"" >> geng.sub
		echo -e "Log =  \"log/${v}_${e}_\$(Step).log\"" >> geng.sub
		echo -e "Error =  \"err/${v}_${e}_\$(Step).err\"" >> geng.sub
		echo -e "Queue 10\n" >> geng.sub
		T=$((T + 1))
	done
done