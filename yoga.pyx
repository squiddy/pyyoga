from libc.stdint cimport uint32_t
from enum import Enum


cdef extern from "yoga/yoga/Yoga.h":
    ctypedef enum YGDirection:
        YGDirectionInherit
        YGDirectionLTR
        YGDirectionRTL

    ctypedef enum YGEdge:
        YGEdgeLeft
        YGEdgeTop
        YGEdgeRight
        YGEdgeBottom
        YGEdgeStart
        YGEdgeEnd
        YGEdgeHorizontal
        YGEdgeVertical
        YGEdgeAll

    ctypedef enum YGFlexDirection:
        YGFlexDirectionColumn
        YGFlexDirectionColumnReverse
        YGFlexDirectionRow
        YGFlexDirectionRowReverse

    ctypedef enum YGJustify:
        YGJustifyFlexStart
        YGJustifyCenter
        YGJustifyFlexEnd
        YGJustifySpaceBetween
        YGJustifySpaceAround

    ctypedef enum YGAlign:
        YGAlignAuto
        YGAlignFlexStart
        YGAlignCenter
        YGAlignFlexEnd
        YGAlignStretch

    ctypedef enum YGPositionType:
        YGPositionTypeRelative
        YGPositionTypeAbsolute

    ctypedef enum YGWrap:
        YGWrapNoWrap
        YGWrapWrap

    ctypedef enum YGOverflow:
        YGOverflowVisible
        YGOverflowHidden
        YGOverflowScroll


cdef extern from "yoga/yoga/Yoga.h":
    ctypedef enum YGUnit:
        YGUnitUndefined
        YGUnitPoint
        YGUnitPercent
        YGUnitAuto

    ctypedef struct YGValue:
        float value
        YGUnit unit

    ctypedef void* YGNodeRef

    # Lifecycle

    YGNodeRef YGNodeNew()
    # TODO void YGNodeReset(YGNodeRef node)
    # TODO void YGNodeFree(YGNodeRef node)
    # TODO void YGNodeFreeRecursive(YGNodeRef node)

    # Children

    void YGNodeInsertChild(YGNodeRef node, YGNodeRef child, uint32_t index)
    void YGNodeRemoveChild(YGNodeRef node, YGNodeRef child)
    YGNodeRef YGNodeGetChild(YGNodeRef node, uint32_t index)
    uint32_t YGNodeGetChildCount(YGNodeRef node)

    # Style getters & setters

    # TODO void YGNodeStyleSetDirection(YGNodeRef node, YGDirection direction)
    # TODO YGDirection YGNodeStyleGetDirection(YGNodeRef node)
    # TODO void YGNodeStyleSetFlexDirection(YGNodeRef node, YGFlexDirection flexDirection)
    # TODO YGFlexDirection YGNodeStyleGetFlexDirection(YGNodeRef node)
    # TODO void YGNodeStyleSetJustifyContent(YGNodeRef node, YGJustify justifyContent)
    # TODO YGJustify YGNodeStyleGetJustifyContent(YGNodeRef node)
    # TODO void YGNodeStyleSetAlignContent(YGNodeRef node, YGAlign alignContent)
    # TODO YGAlign YGNodeStyleGetAlignContent(YGNodeRef node)
    # TODO void YGNodeStyleSetAlignItems(YGNodeRef node, YGAlign alignItems)
    # TODO YGAlign YGNodeStyleGetAlignItems(YGNodeRef node)
    # TODO void YGNodeStyleSetAlignSelf(YGNodeRef node, YGAlign alignSelf)
    # TODO YGAlign YGNodeStyleGetAlignSelf(YGNodeRef node)
    # TODO void YGNodeStyleSetPositionType(YGNodeRef node, YGPositionType positionType)
    # TODO YGPositionType YGNodeStyleGetPositionType(YGNodeRef node)
    # TODO void YGNodeStyleSetFlexWrap(YGNodeRef node, YGWrap flexWrap)
    # TODO YGWrap YGNodeStyleGetFlexWrap(YGNodeRef node)
    # TODO void YGNodeStyleSetOverflow(YGNodeRef node, YGOverflow overflow)
    # TODO YGOverflow YGNodeStyleGetOverflow(YGNodeRef node)
    # TODO void YGNodeStyleSetFlex(YGNodeRef node, float flex)
    # TODO void YGNodeStyleSetFlexGrow(YGNodeRef node, float flexGrow)
    # TODO float YGNodeStyleGetFlexGrow(YGNodeRef node)
    # TODO void YGNodeStyleSetFlexShrink(YGNodeRef node, float flexShrink)
    # TODO float YGNodeStyleGetFlexShrink(YGNodeRef node)
    # TODO void YGNodeStyleSetFlexBasis(YGNodeRef node, float flexBasis)
    # TODO float YGNodeStyleGetFlexBasis(YGNodeRef node)
    void YGNodeStyleSetPosition(YGNodeRef node, YGEdge edge, float position)
    YGValue YGNodeStyleGetPosition(YGNodeRef node, YGEdge edge)
    void YGNodeStyleSetMargin(YGNodeRef node, YGEdge edge, float margin)
    YGValue YGNodeStyleGetMargin(YGNodeRef node, YGEdge edge)
    void YGNodeStyleSetPadding(YGNodeRef node, YGEdge edge, float padding)
    YGValue YGNodeStyleGetPadding(YGNodeRef node, YGEdge edge)
    void YGNodeStyleSetBorder(YGNodeRef node, YGEdge edge, float border)
    float YGNodeStyleGetBorder(YGNodeRef node, YGEdge edge)
    void YGNodeStyleSetWidth(YGNodeRef node, float width)
    YGValue YGNodeStyleGetWidth(YGNodeRef node)
    void YGNodeStyleSetHeight(YGNodeRef node, float height)
    YGValue YGNodeStyleGetHeight(YGNodeRef node)
    void YGNodeStyleSetMinWidth(YGNodeRef node, float minWidth)
    YGValue YGNodeStyleGetMinWidth(YGNodeRef node)
    void YGNodeStyleSetMinHeight(YGNodeRef node, float minHeight)
    YGValue YGNodeStyleGetMinHeight(YGNodeRef node)
    void YGNodeStyleSetMaxWidth(YGNodeRef node, float maxWidth)
    YGValue YGNodeStyleGetMaxWidth(YGNodeRef node)
    void YGNodeStyleSetMaxHeight(YGNodeRef node, float maxHeight)
    YGValue YGNodeStyleGetMaxHeight(YGNodeRef node)
    void YGNodeStyleSetAspectRatio(YGNodeRef node, float aspectRatio)
    float YGNodeStyleGetAspectRatio(YGNodeRef node)

    # Layout

    void YGNodeCalculateLayout(YGNodeRef node, float availableWidth, float availableHeight, YGDirection parentDirection)
    float YGNodeLayoutGetLeft(YGNodeRef node)
    float YGNodeLayoutGetTop(YGNodeRef node)
    float YGNodeLayoutGetRight(YGNodeRef node)
    float YGNodeLayoutGetBottom(YGNodeRef node)
    float YGNodeLayoutGetWidth(YGNodeRef node)
    float YGNodeLayoutGetHeight(YGNodeRef node)
    YGDirection YGNodeLayoutGetDirection(YGNodeRef node)


class Direction(Enum):
    Inherit = YGDirectionInherit
    LTR = YGDirectionLTR
    RTL = YGDirectionRTL


class FlexDirection(Enum):
    Column = YGFlexDirectionColumn
    ColumnReverse = YGFlexDirectionColumnReverse
    Row = YGFlexDirectionRow
    RowReverse = YGFlexDirectionRowReverse


class Justify(Enum):
    FlexStart = YGJustifyFlexStart
    Center = YGJustifyCenter
    FlexEnd = YGJustifyFlexEnd
    SpaceBetween = YGJustifySpaceBetween
    SpaceAround = YGJustifySpaceAround


class Align(Enum):
    Auto = YGAlignAuto
    FlexStart = YGAlignFlexStart
    Center = YGAlignCenter
    FlexEnd = YGAlignFlexEnd
    Stretch = YGAlignStretch


class Edge(Enum):
    Left = YGEdgeLeft
    Top = YGEdgeTop
    Right = YGEdgeRight
    Bottom = YGEdgeBottom
    Start = YGEdgeStart
    End = YGEdgeEnd
    Horizontl = YGEdgeHorizontal
    Vertical = YGEdgeVertical
    All = YGEdgeAll


class PositionType(Enum):
    Relative = YGPositionTypeRelative
    Absolute = YGPositionTypeAbsolute


class Wrap(Enum):
    NoWrap = YGWrapNoWrap
    Wrap = YGWrapWrap


class Overflow(Enum):
    Visible = YGOverflowVisible
    Hidden = YGOverflowHidden
    Scroll = YGOverflowScroll


class Unit(Enum):
    Undefined = YGUnitUndefined
    Point = YGUnitPoint
    Percent = YGUnitPercent
    Auto = YGUnitAuto


cdef class Node:
    cdef YGNodeRef _ref

    @classmethod
    def create(cls):
        cdef Node node = cls()
        node._ref = YGNodeNew()
        return node

    # Children

    def insert_child(self, Node child not None, uint32_t index):
        YGNodeInsertChild(self._ref, child._ref, index)

    def get_child(self, uint32_t index):
        if index >= self.child_count:
            raise Exception('Invalid child index')

        cdef Node node = Node()
        cdef YGNodeRef ref = YGNodeGetChild(self._ref, index)
        node._ref = ref
        return node

    def remove_child(self, Node child not None):
        YGNodeRemoveChild(self._ref, child._ref)

    @property
    def children(self):
        for i in range(self.child_count):
            yield self.get_child(i)

    @property
    def child_count(self):
        return YGNodeGetChildCount(self._ref)

    # Style setters & getters

    def set_padding(self, edge, value):
        YGNodeStyleSetPadding(self._ref, edge.value, value)

    def get_padding(self, edge):
        return YGNodeStyleGetPadding(self._ref, edge.value)

    def set_border(self, edge, value):
        YGNodeStyleSetBorder(self._ref, edge.value, value)

    def get_border(self, edge):
        return YGNodeStyleGetBorder(self._ref, edge.value)

    def set_margin(self, edge, value):
        YGNodeStyleSetMargin(self._ref, edge.value, value)

    def get_margin(self, edge):
        return YGNodeStyleGetMargin(self._ref, edge.value)

    def set_position(self, edge, value):
        YGNodeStyleSetPosition(self._ref, edge.value, value)

    def get_position(self, edge):
        return YGNodeStyleGetPosition(self._ref, edge.value)

    @property
    def width(self):
        return YGNodeStyleGetWidth(self._ref)

    @width.setter
    def width(self, value):
        YGNodeStyleSetWidth(self._ref, value)

    @property
    def min_width(self):
        return YGNodeStyleGetMinWidth(self._ref)

    @min_width.setter
    def min_width(self, value):
        YGNodeStyleSetMinWidth(self._ref, value)

    @property
    def max_width(self):
        return YGNodeStyleGetMaxWidth(self._ref)

    @max_width.setter
    def max_width(self, value):
        YGNodeStyleSetMaxWidth(self._ref, value)

    @property
    def height(self):
        return YGNodeStyleGetHeight(self._ref)

    @height.setter
    def height(self, value):
        YGNodeStyleSetHeight(self._ref, value)

    @property
    def min_height(self):
        return YGNodeStyleGetMinHeight(self._ref)

    @min_height.setter
    def min_height(self, value):
        YGNodeStyleSetMinHeight(self._ref, value)

    @property
    def max_height(self):
        return YGNodeStyleGetMaxHeight(self._ref)

    @max_height.setter
    def max_height(self, value):
        YGNodeStyleSetMaxHeight(self._ref, value)

    @property
    def aspect_ratio(self):
        return YGNodeStyleGetAspectRatio(self._ref)

    @aspect_ratio.setter
    def aspect_ratio(self, value):
        YGNodeStyleSetAspectRatio(self._ref, value)

    # Layout

    @property
    def calculated_left(self):
        return YGNodeLayoutGetLeft(self._ref)

    @property
    def calculated_top(self):
        return YGNodeLayoutGetTop(self._ref)

    @property
    def calculated_right(self):
        return YGNodeLayoutGetRight(self._ref)

    @property
    def calculated_bottom(self):
        return YGNodeLayoutGetBottom(self._ref)

    @property
    def calculated_width(self):
        return YGNodeLayoutGetWidth(self._ref)

    @property
    def calculated_height(self):
        return YGNodeLayoutGetHeight(self._ref)

    @property
    def calculated_direction(self):
        return YGNodeLayoutGetDirection(self._ref)

    def calculate_layout(self, width=None, height=None, direction=Direction.Inherit):
        if width is None:
            width = float('nan')
        if height is None:
            height = float('nan')

        YGNodeCalculateLayout(self._ref, width, height, direction.value)
