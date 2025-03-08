CREATE TABLE data (
    name TEXT NOT NULL,
    ply INTEGER(1) NOT NULL,
    rolls INTEGER(2) NOT NULL,
    sheets INTEGER(3) NOT NULL,
    uses INTEGER(4),
    multiQuan INTEGER(1) NOT NULL,
    multiDisc INTEGER(2) NOT NULL,
    cost REAL(2,2) NOT NULL,
    delivery REAL(1,2) NOT NULL,
    useCost REAL(4,2),
    useCostDisc REAL(4,2),
    url TEXT
);
UPDATE data SET
                uses = (
                    sheets * rolls
                    )
                    /
                    (
                        (
                            CASE
                                WHEN ply = 3
                                    THEN 3
                                WHEN ply = 4
                                    THEN 2
                            END
                        )
                    );
UPDATE data SET useCost = (
    cost + delivery
    )
    /
    uses;
UPDATE data SET useCostDisc = useCost * (
    (
        CASE
            WHEN multiDisc = 0
                THEN 1
            ELSE (
                1 - multiDisc / 100
            )
        END
    )
    );

SELECT * from data ORDER BY useCost;
SELECT * from data ORDER BY useCostDisc;