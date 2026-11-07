; ModuleID = '/home/cbh/galapagos-corey-runs/corey-alsa-baseline-r1/functions/alsa-lib/variants/c/0_alaw_to_s16_8.bc'
source_filename = "/home/cbh/galapagos-corey-runs/corey-alsa-baseline-r1/functions/alsa-lib/variants/c/0_alaw_to_s16_8.c"
target datalayout = "e-m:e-p270:32:32-p271:32:32-p272:64:64-i64:64-f80:128-n8:16:32:64-S128"
target triple = "x86_64-unknown-linux-gnu"

; Function Attrs: noinline nounwind optnone uwtable
define dso_local i32 @main() #0 {
entry:
  %call = call i32 @alaw_to_s16(i8 noundef zeroext 97)
  ret i32 0
}

; Function Attrs: noinline nounwind optnone uwtable
define internal i32 @alaw_to_s16(i8 noundef zeroext %a_val) #0 {
entry:
  %a_val.addr = alloca i8, align 1
  %segment = alloca i32, align 4
  %magnitude = alloca i32, align 4
  %shift = alloca i32, align 4
  store i8 %a_val, ptr %a_val.addr, align 1
  %0 = load i8, ptr %a_val.addr, align 1
  %conv = zext i8 %0 to i32
  %xor = xor i32 %conv, 85
  %conv1 = trunc i32 %xor to i8
  store i8 %conv1, ptr %a_val.addr, align 1
  %1 = load i8, ptr %a_val.addr, align 1
  %conv2 = zext i8 %1 to i32
  %shr = ashr i32 %conv2, 4
  %and = and i32 %shr, 7
  store i32 %and, ptr %segment, align 4
  %2 = load i32, ptr %segment, align 4
  %cmp = icmp sgt i32 %2, 1
  br i1 %cmp, label %cond.true, label %cond.false

cond.true:                                        ; preds = %entry
  %3 = load i32, ptr %segment, align 4
  %sub = sub nsw i32 %3, 1
  br label %cond.end

cond.false:                                       ; preds = %entry
  br label %cond.end

cond.end:                                         ; preds = %cond.false, %cond.true
  %cond = phi i32 [ %sub, %cond.true ], [ 0, %cond.false ]
  store i32 %cond, ptr %shift, align 4
  %4 = load i32, ptr %segment, align 4
  %tobool = icmp ne i32 %4, 0
  br i1 %tobool, label %cond.true4, label %cond.false5

cond.true4:                                       ; preds = %cond.end
  %5 = load i32, ptr %shift, align 4
  %shl = shl i32 264, %5
  br label %cond.end6

cond.false5:                                      ; preds = %cond.end
  br label %cond.end6

cond.end6:                                        ; preds = %cond.false5, %cond.true4
  %cond7 = phi i32 [ %shl, %cond.true4 ], [ 8, %cond.false5 ]
  store i32 %cond7, ptr %magnitude, align 4
  %6 = load i8, ptr %a_val.addr, align 1
  %conv8 = zext i8 %6 to i32
  %and9 = and i32 %conv8, 1
  %tobool10 = icmp ne i32 %and9, 0
  br i1 %tobool10, label %if.then, label %if.end

if.then:                                          ; preds = %cond.end6
  %7 = load i32, ptr %shift, align 4
  %shl11 = shl i32 16, %7
  %8 = load i32, ptr %magnitude, align 4
  %add = add nsw i32 %8, %shl11
  store i32 %add, ptr %magnitude, align 4
  br label %if.end

if.end:                                           ; preds = %if.then, %cond.end6
  %9 = load i8, ptr %a_val.addr, align 1
  %conv12 = zext i8 %9 to i32
  %and13 = and i32 %conv12, 2
  %tobool14 = icmp ne i32 %and13, 0
  br i1 %tobool14, label %if.then15, label %if.end18

if.then15:                                        ; preds = %if.end
  %10 = load i32, ptr %shift, align 4
  %shl16 = shl i32 32, %10
  %11 = load i32, ptr %magnitude, align 4
  %add17 = add nsw i32 %11, %shl16
  store i32 %add17, ptr %magnitude, align 4
  br label %if.end18

if.end18:                                         ; preds = %if.then15, %if.end
  %12 = load i8, ptr %a_val.addr, align 1
  %conv19 = zext i8 %12 to i32
  %and20 = and i32 %conv19, 4
  %tobool21 = icmp ne i32 %and20, 0
  br i1 %tobool21, label %if.then22, label %if.end25

if.then22:                                        ; preds = %if.end18
  %13 = load i32, ptr %shift, align 4
  %shl23 = shl i32 64, %13
  %14 = load i32, ptr %magnitude, align 4
  %add24 = add nsw i32 %14, %shl23
  store i32 %add24, ptr %magnitude, align 4
  br label %if.end25

if.end25:                                         ; preds = %if.then22, %if.end18
  %15 = load i8, ptr %a_val.addr, align 1
  %conv26 = zext i8 %15 to i32
  %and27 = and i32 %conv26, 8
  %tobool28 = icmp ne i32 %and27, 0
  br i1 %tobool28, label %if.then29, label %if.end32

if.then29:                                        ; preds = %if.end25
  %16 = load i32, ptr %shift, align 4
  %shl30 = shl i32 128, %16
  %17 = load i32, ptr %magnitude, align 4
  %add31 = add nsw i32 %17, %shl30
  store i32 %add31, ptr %magnitude, align 4
  br label %if.end32

if.end32:                                         ; preds = %if.then29, %if.end25
  %18 = load i8, ptr %a_val.addr, align 1
  %conv33 = zext i8 %18 to i32
  %and34 = and i32 %conv33, 128
  %tobool35 = icmp ne i32 %and34, 0
  br i1 %tobool35, label %cond.true36, label %cond.false37

cond.true36:                                      ; preds = %if.end32
  %19 = load i32, ptr %magnitude, align 4
  br label %cond.end39

cond.false37:                                     ; preds = %if.end32
  %20 = load i32, ptr %magnitude, align 4
  %sub38 = sub nsw i32 0, %20
  br label %cond.end39

cond.end39:                                       ; preds = %cond.false37, %cond.true36
  %cond40 = phi i32 [ %19, %cond.true36 ], [ %sub38, %cond.false37 ]
  ret i32 %cond40
}

attributes #0 = { noinline nounwind optnone uwtable "frame-pointer"="all" "min-legal-vector-width"="0" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "tune-cpu"="generic" }

!llvm.module.flags = !{!0, !1, !2, !3, !4}
!llvm.ident = !{!5}

!0 = !{i32 1, !"wchar_size", i32 4}
!1 = !{i32 8, !"PIC Level", i32 2}
!2 = !{i32 7, !"PIE Level", i32 2}
!3 = !{i32 7, !"uwtable", i32 2}
!4 = !{i32 7, !"frame-pointer", i32 2}
!5 = !{!"clang version 17.0.0 (git@github.com:llvm/llvm-project.git 1a7a00bdc99fa2b2ca19ecd2d1069991b3c1006b)"}
