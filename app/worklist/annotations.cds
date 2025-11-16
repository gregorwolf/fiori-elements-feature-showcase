using WorkListODataService as srv from '../../srv/worklist-srv';
annotate srv.ChildEntities2 with @(
    UI.LineItem : [
        {
            Value : stringProperty,
        },
        {
            Value : integerProperty,
        },
        {
            Value : decimalProperty,
        },
        {
            Value : country_code,
        },
    ],
    // Search-Term: #DefaultSortFilter
    UI.SelectionPresentationVariant #DefaultFilter : {
        SelectionVariant    : {
            SelectOptions   : [
                {
                    PropertyName    : integerProperty,
                    Ranges          : [
                        {
                            Sign    : #I,
                            Option  : #GE,
                            Low     : 0,
                        },
                    ],
                },
            ],
        },
        PresentationVariant : {
            SortOrder       : [
                {
                    Property : country_code,
                },
            ],
            Visualizations  : ['@UI.LineItem'],
        },
    },
);

// UI.FieldGroup
annotate srv.ChildEntities2 with @(
    UI.FieldGroup #data : {
        Data    : [
            {Value : stringProperty, @Common.FieldControl : #ReadOnly},
            {Value : integerProperty, @Common.FieldControl : #ReadOnly},
            {Value : decimalProperty, @Common.FieldControl : #ReadOnly},
            {Value : country_code, @Common.FieldControl : #ReadOnly}
        ],
    },
) {
    country @Common.Text : country.name @Common.TextArrangement #TextFirst;
};

annotate srv.ChildEntities2 with @(
    UI.Facets : [
        {
            $Type   : 'UI.CollectionFacet',
            ID      : 'collectionFacetSection',
            Label   : '{i18n>collectionSection}',
            Facets  : [
                {
                    $Type   : 'UI.ReferenceFacet',
                    Target  : '@UI.FieldGroup#data',
                    ID      : 'SubSectionID',
                    Label   : '{i18n>subSection}',
                },
            ],
        },
    ],
);
