const getAllDebt = () => {
    return [{
        name: 'Example 1',
        money: 400,
        people: [
            {
                id: 1,
                name: 'Carlos',
                pay: 0,
                value: 0
            },
            {
                id: 2,
                name: 'Martín',
                pay: 0,
                value: 0
            },
            {
                id: 3,
                name: 'Paula',
                pay: 0,
                value: 0
            }, {
                id: 4,
                name: 'Arberto',
                pay: 0,
                value: 0
            }
        ],
        pays: [
            {
                payId: 1,
                payBy: 3,
                amount: 380,
                payFor: [
                    1, 3
                ]
            }, {
                payId: 2,
                payBy: 1,
                amount: 20,
                payFor: [
                    1, 3
                ]
            }, {
                payId: 3,
                payBy: 4,
                amount: 1200,
                payFor: [
                    3, 4
                ]
            }

        ]
    }, {
        name: 'Example 2',
        money: 400,
        people: [
            {
                id: 1,
                name: 'Carlos',
                pay: 20,
                value: -180
            },
            {
                id: 2,
                name: 'Martín',
                pay: 0,
                value: 0
            },
            {
                id: 3,
                name: 'Paula',
                pay: 380,
                value: 0
            }
        ],
        pays: [
            {
                payId: 1,
                payBy: 3,
                amount: 380,
                payFor: [
                    1, 3
                ]
            }, {
                payId: 2,
                payBy: 1,
                amount: 20,
                payFor: [
                    1, 3
                ]
            }

        ]
    }, {
        name: 'Example 3',
        money: 400,
        people: [
            {
                id: 1,
                name: 'Carlos',
                pay: 20,
                value: -180
            },
            {
                id: 2,
                name: 'Martín',
                pay: 0,
                value: 0
            },
            {
                id: 3,
                name: 'Paula',
                pay: 380,
                value: 0
            }
        ],
        pays: [
            {
                payId: 1,
                payBy: 3,
                amount: 380,
                payFor: [
                    1, 3
                ]
            }, {
                payId: 2,
                payBy: 1,
                amount: 20,
                payFor: [
                    1, 3
                ]
            }

        ]
    }, {
        name: 'Example 4',
        money: 400,
        people: [
            {
                id: 1,
                name: 'Carlos',
                pay: 20,
                value: -180
            },
            {
                id: 2,
                name: 'Martín',
                pay: 0,
                value: 0
            },
            {
                id: 3,
                name: 'Paula',
                pay: 380,
                value: 0
            }
        ],
        pays: [
            {
                payId: 1,
                payBy: 3,
                amount: 380,
                payFor: [
                    1, 3
                ]
            }, {
                payId: 2,
                payBy: 1,
                amount: 20,
                payFor: [
                    1, 3
                ]
            }

        ]
    }]
}

export default { getAllDebt }