UPDATE data SET
                uses = (
                    sheets * rolls
                    )
                    /
                    (
                        CASE
                            WHEN ply = 3
                                THEN 3
                            WHEN ply = 4
                                THEN 2
                        END
                    );
UPDATE data SET useCost = (
    cost + delivery
    )
    /
    uses;
UPDATE data SET useCostDisc = useCost * multiDisc;

SELECT * from data ORDER BY useCost;
SELECT * from data ORDER BY useCostDisc;