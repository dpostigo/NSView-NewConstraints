//
// Created by Dani Postigo on 1/20/14.
// Copyright (c) 2014 Elastic Creative. All rights reserved.
//

#import "NSView+NewConstraint.h"

@implementation NSView (NewConstraint)

- (NSLayoutConstraint *) superConstrainAttribute: (NSLayoutAttribute) attribute offset: (CGFloat) offset {
    NSLayoutConstraint *ret = nil;
    if (self.superview) {
        ret = [NSLayoutConstraint constraintWithItem: self.superview attribute: attribute relatedBy: NSLayoutRelationEqual toItem: self attribute: attribute multiplier: 1.0 constant: offset];
        [self.superview addConstraint: ret];
    }
    return ret;
}


- (NSLayoutConstraint *) superConstrainAttributeWithSelf: (NSLayoutAttribute) attribute offset: (CGFloat) offset {
    return [self superConstrainAttribute: attribute offset: offset firstItem: self secondItem: self.superview];
}

- (NSLayoutConstraint *) superConstrainAttribute: (NSLayoutAttribute) attribute offset: (CGFloat) offset firstItem: (id) item secondItem: (id) item2 {
    NSLayoutConstraint *ret = nil;
    if (self.superview) {
        ret = [NSLayoutConstraint constraintWithItem: item attribute: attribute relatedBy: NSLayoutRelationEqual toItem: item2 attribute: attribute multiplier: 1.0 constant: offset];
        [self.superview addConstraint: ret];
    }
    return ret;
}


#pragma mark Width


- (void) updateSuperWidthConstraint: (CGFloat) offset {
    NSLayoutConstraint *constraint = self.superWidthConstraint;
    if (constraint == nil) {
        constraint = [self superConstrainWidth: offset];
    }
    constraint.constant = offset;
}


- (NSLayoutConstraint *) superWidthConstraint {
    return [self superReversedConstraintForAttribute: NSLayoutAttributeWidth];
}

- (NSLayoutConstraint *) superConstrainWidth {
    return [self superConstrainWidth: 0];
}

- (NSLayoutConstraint *) superConstrainWidth: (CGFloat) offset {
    return [self superConstrainAttributeWithSelf: NSLayoutAttributeWidth offset: offset];
}


#pragma mark Height


- (void) updateSuperHeightConstraint: (CGFloat) offset {
    NSLayoutConstraint *constraint = self.superHeightConstraint;
    constraint.constant = offset;
}

- (NSLayoutConstraint *) superHeightConstraint {
    return [self superReversedConstraintForAttribute: NSLayoutAttributeHeight];
}

- (NSLayoutConstraint *) superConstrainHeight {
    return [self superConstrainHeight: 0];
}

- (NSLayoutConstraint *) superConstrainHeight: (CGFloat) offset {
    return [self superConstrainAttributeWithSelf: NSLayoutAttributeHeight offset: offset];
}


#pragma mark Center X


- (void) updateCenterXConstraint: (CGFloat) offset {
    NSLayoutConstraint *constraint = self.superCenterXConstraint;
    constraint.constant = offset;
}

- (NSLayoutConstraint *) superCenterXConstraint {
    return [self superReversedConstraintForAttribute: NSLayoutAttributeCenterX];
}

- (NSLayoutConstraint *) superConstrainCenterX {
    return [self superConstrainCenterX: 0];
}

- (NSLayoutConstraint *) superConstrainCenterX: (CGFloat) offset {
    return [self superConstrainAttributeWithSelf: NSLayoutAttributeCenterX offset: offset];
}


#pragma mark Center Y


- (void) updateCenterYConstraint: (CGFloat) offset {
    NSLayoutConstraint *constraint = self.superCenterYConstraint;
    constraint.constant = offset;
}

- (NSLayoutConstraint *) superCenterYConstraint {
    return [self superReversedConstraintForAttribute: NSLayoutAttributeCenterY];
}

- (NSLayoutConstraint *) superConstrainCenterY {
    return [self superConstrainCenterY: 0];
}

- (NSLayoutConstraint *) superConstrainCenterY: (CGFloat) offset {
    return [self superConstrainAttributeWithSelf: NSLayoutAttributeCenterY offset: offset];
}


#pragma mark Leading

- (void) updateSuperLeadingConstraint: (CGFloat) offset {
    NSLayoutConstraint *constraint = self.superLeadingConstraint;
    if (constraint == nil) {
        constraint = [self superConstrainLeading: offset];
    }
    constraint.constant = offset;
}


- (NSLayoutConstraint *) superLeadingConstraint {
    NSLayoutConstraint *ret = [self superReversedConstraintForAttribute: NSLayoutAttributeLeading];
    if (ret == nil) {
        ret = [self superConstraintForAttribute: NSLayoutAttributeLeading];
    }
    return ret;
}

- (NSLayoutConstraint *) superConstrainLeading {
    return [self superConstrainLeading: 0];
}

- (NSLayoutConstraint *) superConstrainLeading: (CGFloat) offset {
    return [self superConstrainAttributeWithSelf: NSLayoutAttributeLeading offset: offset];
}


- (NSLayoutConstraint *) superConstrainLeadingToItem: (id) item {
    return [self superConstrainLeadingToItem: item offset: 0];
}

- (NSLayoutConstraint *) superConstrainLeadingToItem: (id) item offset: (CGFloat) offset {
    return [self superConstrainAttribute: NSLayoutAttributeLeading offset: offset firstItem: item secondItem: self];
}






#pragma mark Trailing



- (void) updateSuperTrailingConstraint: (CGFloat) offset {
    NSLayoutConstraint *constraint = self.superTrailingConstraint;
    if (constraint == nil) {
        constraint = [self superConstrainTrailing: offset];
    }
    constraint.constant = offset;
}


- (NSLayoutConstraint *) superTrailingConstraint {
    NSLayoutConstraint *ret = [self superReversedConstraintForAttribute: NSLayoutAttributeTrailing];
    if (ret == nil) {
        ret = [self superConstraintForAttribute: NSLayoutAttributeTrailing];
    }
    return ret;
}

- (NSLayoutConstraint *) superConstrainTrailing {
    return [self superConstrainTrailing: 0];
}

- (NSLayoutConstraint *) superConstrainTrailing: (CGFloat) offset {
    return [self superConstrainAttribute: NSLayoutAttributeTrailing offset: offset];
}


#pragma mark Top



- (void) updateSuperTopConstraint: (CGFloat) offset {
    NSLayoutConstraint *constraint = self.superTopConstraint;
    if (constraint == nil) {
        constraint = [self superConstrainTop: offset];
    }
    constraint.constant = offset;
}

- (NSLayoutConstraint *) superTopConstraint {
    return [self superConstraintForAttribute: NSLayoutAttributeTop];
}

- (NSLayoutConstraint *) superConstrainTop: (CGFloat) offset {
    return [self superConstrainAttributeWithSelf: NSLayoutAttributeTop offset: offset];
}

- (NSLayoutConstraint *) superConstrainTop {
    return [self superConstrainTop: 0];
}

#pragma mark Top, item

- (NSLayoutConstraint *) superConstrainTopToItem: (id) item {
    return [self superConstrainTopToItem: item offset: 0];
}

- (NSLayoutConstraint *) superConstrainTopToItem: (id) item offset: (CGFloat) offset {
    return [self superConstrainAttribute: NSLayoutAttributeTop offset: offset firstItem: item secondItem: self];
}



#pragma mark Bottom


- (void) updateSuperBottomConstraint: (CGFloat) offset {
    NSLayoutConstraint *constraint = self.superBottomConstraint;
    if (constraint == nil) {
        constraint = [self superConstrainBottom: offset];
    }
    constraint.constant = offset;
}

- (NSLayoutConstraint *) superBottomConstraint {
    return [self superReversedConstraintForAttribute: NSLayoutAttributeBottom];
}


- (NSLayoutConstraint *) superConstrainBottom {
    return [self superConstrainBottom: 0];
}

- (NSLayoutConstraint *) superConstrainBottom: (CGFloat) offset {
    return [self superConstrainAttribute: NSLayoutAttributeBottom offset: offset];
}



#pragma mark All


- (void) updateSuperConstraintsWithInsets: (NSEdgeInsets) insets {
    [self updateSuperLeadingConstraint: insets.left];
    [self updateSuperTrailingConstraint: insets.right];
    [self updateSuperTopConstraint: insets.top];
    [self updateSuperBottomConstraint: insets.bottom];
}

- (NSArray *) superConstrainEdges {
    return [self superConstrainEdges: 0];
}


- (NSArray *) superConstrainEdges: (CGFloat) offset {
    NSMutableArray *ret = [[NSMutableArray alloc] init];
    if (self.superview) {
        [ret addObject: [self superConstrainLeading: offset]];
        [ret addObject: [self superConstrainTrailing: offset]];
        [ret addObject: [self superConstrainTop: offset]];
        [ret addObject: [self superConstrainBottom: offset]];
    }
    return ret;
}


- (NSArray *) superConstrainWithInsets: (NSEdgeInsets) insets {
    NSMutableArray *ret = [[NSMutableArray alloc] init];
    if (self.superview) {
        [ret addObject: [self superConstrainLeading: insets.left]];
        [ret addObject: [self superConstrainTrailing: insets.right]];
        [ret addObject: [self superConstrainTop: insets.top]];
        [ret addObject: [self superConstrainBottom: insets.bottom]];
    }
    return ret;
}



#pragma mark Find constraints

- (NSLayoutConstraint *) superConstraintForAttribute: (NSLayoutAttribute) attribute {
    NSLayoutConstraint *ret = nil;
    if (self.superview) {

        NSArray *constraints = [NSArray arrayWithArray: self.superview.constraints];
        for (NSLayoutConstraint *constraint in constraints) {
            if (constraint.firstItem == self && constraint.secondItem == self.superview
                    && constraint.firstAttribute == attribute && constraint.secondAttribute == attribute) {
                ret = constraint;
                break;
            }

        }
    }
    return ret;
}

- (NSLayoutConstraint *) superReversedConstraintForAttribute: (NSLayoutAttribute) attribute {
    NSLayoutConstraint *ret = nil;
    if (self.superview) {

        NSArray *constraints = [NSArray arrayWithArray: self.superview.constraints];
        for (NSLayoutConstraint *constraint in constraints) {
            if (constraint.firstItem == self.superview && constraint.secondItem == self
                    && constraint.firstAttribute == attribute && constraint.secondAttribute == attribute) {
                ret = constraint;
                break;
            }

        }
    }
    return ret;
}



#pragma mark More constraints


- (NSLayoutConstraint *) viewWidthConstraint {
    return [self viewConstraint: NSLayoutAttributeWidth];
}

- (NSLayoutConstraint *) viewHeightConstraint {
    return [self viewConstraint: NSLayoutAttributeHeight];
}

- (NSLayoutConstraint *) viewConstraint: (NSLayoutAttribute) attribute {
    NSLayoutConstraint *ret = nil;

    NSArray *constraints = [NSArray arrayWithArray: self.constraints];
    for (NSLayoutConstraint *constraint in constraints) {
        if (constraint.firstItem == self &&
                constraint.secondItem == nil  &&
                constraint.firstAttribute == attribute &&
                constraint.secondAttribute == NSLayoutAttributeNotAnAttribute) {
            ret = constraint;
            break;
        }
    }
    return ret;
}
@end