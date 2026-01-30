using LROPODataService as srv from '../../srv/list-report-srv';

//
// annotations that control the behavior of fields and actions
//

annotate srv.RootEntities {
    ID              @readonly        @mandatory;
    stringProperty             @Core.Immutable  @mandatory @UI.ExcludeFromNavigationContext; //Search-Term: #CreationDialog
    uom             @UI.Hidden @UI.ExcludeFromNavigationContext;

    association2one @(
        //Search-Term: #Navigation
        //Semantic Object annotation in order to show the links to the semantic object apps in the quick view facet
        Common.SemanticObject : 'FeatureShowcaseChildEntity2',
        Common.SemanticObjectMapping : [
            {
                // Semantic object mapping is done, to set filter values when navigation to the semantic object map
                // No logical sensen behind the connection - just to demonstrate
                $Type : 'Common.SemanticObjectMappingType',
                LocalProperty : integerValue,
                SemanticObjectProperty : 'integerProperty',
            },
            {
                $Type                   : 'Common.SemanticObjectMappingType',
                LocalProperty           : association2one_ID,
                SemanticObjectProperty  : 'ID',
            },
        ], 
    );
    
    fieldWithURLtext                    @UI.HiddenFilter @HTML5.LinkTarget : '_blank' @UI.ExcludeFromNavigationContext; //Search-Term: #HideFilter, #Link

    /** Search-Term: #FilterDefault
        For a default filter value in the list report. Does not support complex values */ 
    //stringProperty @Common.FilterDefaultValue : 'Root entity 4'; 
    
    region                              @UI.HiddenFilter; //Filter not available in the list report
    deletePossible                      @UI.Hidden;
    updateHidden                        @UI.Hidden @UI.ExcludeFromNavigationContext;
    fieldWithURL                        @UI.Hidden @UI.ExcludeFromNavigationContext;
    starsValue                          @UI.ExcludeFromNavigationContext;
    fieldWithCriticality                @UI.ExcludeFromNavigationContext;
    fieldWithPrice                      @UI.ExcludeFromNavigationContext;
    validFrom                           @UI.ExcludeFromNavigationContext;
    validTo                             @UI.ExcludeFromNavigationContext;
    isoCurrency                         @UI.ExcludeFromNavigationContext;
    imageUrl                            @UI.ExcludeFromNavigationContext;
    fieldWithUoM                        @UI.ExcludeFromNavigationContext;
    forecastValue                       @UI.ExcludeFromNavigationContext;
    targetValue                         @UI.ExcludeFromNavigationContext;
    dimensions                          @UI.ExcludeFromNavigationContext;
    HasActiveEntity                     @UI.ExcludeFromNavigationContext;
    HasDraftEntity                      @UI.ExcludeFromNavigationContext;
    IsActiveEntity                      @UI.ExcludeFromNavigationContext;
    country                             @UI.ExcludeFromNavigationContext;
    criticality                         @UI.ExcludeFromNavigationContext;
    criticality_code                    @UI.ExcludeFromNavigationContext;
    deletePossible                      @UI.ExcludeFromNavigationContext;
    description                         @UI.ExcludeFromNavigationContext;
    description_customGrowing           @UI.ExcludeFromNavigationContext;
    timeStamp                           @UI.ExcludeFromNavigationContext;
    telephone                           @UI.ExcludeFromNavigationContext;
    time                                @UI.ExcludeFromNavigationContext;

    email @mandatory @UI.ExcludeFromNavigationContext;
};

annotate srv.RootEntities actions {
    //Search-Terms: #SideEffect, #ParameterDefaultValue
    changeProgress  @(
        //Update the UI after action
        Common.SideEffects              : {
            TargetProperties : [($self.criticality_code), 'in/integerValue']
        },
        Core.OperationAvailable: ($self.integerValue > 0)
    )
}


annotate srv.ChildEntities1 {
    ID      @UI.Hidden @readonly @mandatory;
    parent  @UI.Hidden;
    field @Core.Immutable @mandatory;
};

annotate srv.criticalAction with @(
    Common.IsActionCritical : true //Search-Term: #CriticalAction
);

annotate srv.GrandChildEntities {
    ID      @UI.Hidden @readonly @mandatory;
    parent  @UI.Hidden;
};

annotate srv.ChildEntities2 {
    ID      @UI.Hidden @readonly @mandatory;
};

annotate srv.ChartDataEntities {
    ID      @UI.Hidden @readonly @mandatory;
    parent  @UI.Hidden @Core.Immutable;

    areaChartDeviationLowerBoundValue   @UI.HiddenFilter;
    areaChartDeviationUpperBoundValue   @UI.HiddenFilter;
    areaChartToleranceLowerBoundValue   @UI.HiddenFilter;
    areaChartToleranceUpperBoundValue   @UI.HiddenFilter;
}