; ModuleID = '/home/cbh/galapagos-corey-runs/corey-study-alsa-lib-context-r2/functions/alsa-lib/variants/c/0_alaw_to_s16_7.bc'
source_filename = "/home/cbh/galapagos-corey-runs/corey-study-alsa-lib-context-r2/functions/alsa-lib/variants/c/0_alaw_to_s16_7.c"
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
  %x = alloca i32, align 4
  %seg = alloca i32, align 4
  %t = alloca i32, align 4
  store i8 %a_val, ptr %a_val.addr, align 1
  %0 = load i8, ptr %a_val.addr, align 1
  %conv = zext i8 %0 to i32
  %xor = xor i32 %conv, 85
  store i32 %xor, ptr %x, align 4
  %1 = load i32, ptr %x, align 4
  %shr = ashr i32 %1, 4
  %and = and i32 %shr, 7
  store i32 %and, ptr %seg, align 4
  %2 = load i32, ptr %x, align 4
  %and1 = and i32 %2, 15
  %shl = shl i32 %and1, 4
  %add = add nsw i32 %shl, 8
  store i32 %add, ptr %t, align 4
  %3 = load i32, ptr %seg, align 4
  %cmp = icmp sgt i32 %3, 0
  br i1 %cmp, label %if.then, label %if.end

if.then:                                          ; preds = %entry
  %4 = load i32, ptr %t, align 4
  %add3 = add nsw i32 %4, 256
  store i32 %add3, ptr %t, align 4
  br label %if.end

if.end:                                           ; preds = %if.then, %entry
  %5 = load i32, ptr %seg, align 4
  %cmp4 = icmp sgt i32 %5, 1
  br i1 %cmp4, label %if.then6, label %if.end7

if.then6:                                         ; preds = %if.end
  %6 = load i32, ptr %t, align 4
  %mul = mul nsw i32 %6, 2
  store i32 %mul, ptr %t, align 4
  br label %if.end7

if.end7:                                          ; preds = %if.then6, %if.end
  %7 = load i32, ptr %seg, align 4
  %cmp8 = icmp sgt i32 %7, 2
  br i1 %cmp8, label %if.then10, label %if.end12

if.then10:                                        ; preds = %if.end7
  %8 = load i32, ptr %t, align 4
  %mul11 = mul nsw i32 %8, 2
  store i32 %mul11, ptr %t, align 4
  br label %if.end12

if.end12:                                         ; preds = %if.then10, %if.end7
  %9 = load i32, ptr %seg, align 4
  %cmp13 = icmp sgt i32 %9, 3
  br i1 %cmp13, label %if.then15, label %if.end17

if.then15:                                        ; preds = %if.end12
  %10 = load i32, ptr %t, align 4
  %mul16 = mul nsw i32 %10, 2
  store i32 %mul16, ptr %t, align 4
  br label %if.end17

if.end17:                                         ; preds = %if.then15, %if.end12
  %11 = load i32, ptr %seg, align 4
  %cmp18 = icmp sgt i32 %11, 4
  br i1 %cmp18, label %if.then20, label %if.end22

if.then20:                                        ; preds = %if.end17
  %12 = load i32, ptr %t, align 4
  %mul21 = mul nsw i32 %12, 2
  store i32 %mul21, ptr %t, align 4
  br label %if.end22

if.end22:                                         ; preds = %if.then20, %if.end17
  %13 = load i32, ptr %seg, align 4
  %cmp23 = icmp sgt i32 %13, 5
  br i1 %cmp23, label %if.then25, label %if.end27

if.then25:                                        ; preds = %if.end22
  %14 = load i32, ptr %t, align 4
  %mul26 = mul nsw i32 %14, 2
  store i32 %mul26, ptr %t, align 4
  br label %if.end27

if.end27:                                         ; preds = %if.then25, %if.end22
  %15 = load i32, ptr %seg, align 4
  %cmp28 = icmp sgt i32 %15, 6
  br i1 %cmp28, label %if.then30, label %if.end32

if.then30:                                        ; preds = %if.end27
  %16 = load i32, ptr %t, align 4
  %mul31 = mul nsw i32 %16, 2
  store i32 %mul31, ptr %t, align 4
  br label %if.end32

if.end32:                                         ; preds = %if.then30, %if.end27
  %17 = load i32, ptr %x, align 4
  %and33 = and i32 %17, 128
  %tobool = icmp ne i32 %and33, 0
  br i1 %tobool, label %cond.true, label %cond.false

cond.true:                                        ; preds = %if.end32
  %18 = load i32, ptr %t, align 4
  br label %cond.end

cond.false:                                       ; preds = %if.end32
  %19 = load i32, ptr %t, align 4
  %sub = sub nsw i32 0, %19
  br label %cond.end

cond.end:                                         ; preds = %cond.false, %cond.true
  %cond = phi i32 [ %18, %cond.true ], [ %sub, %cond.false ]
  ret i32 %cond
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
