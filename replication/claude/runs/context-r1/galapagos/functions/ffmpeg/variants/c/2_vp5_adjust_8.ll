; ModuleID = '/home/liolsen/galapagos-replication/functions/ffmpeg/variants/c/2_vp5_adjust_8.bc'
source_filename = "/home/liolsen/galapagos-replication/functions/ffmpeg/variants/c/2_vp5_adjust_8.c"
target datalayout = "e-m:e-p270:32:32-p271:32:32-p272:64:64-i64:64-f80:128-n8:16:32:64-S128"
target triple = "x86_64-unknown-linux-gnu"

; Function Attrs: noinline nounwind optnone uwtable
define dso_local i32 @main() #0 {
entry:
  %call = call i32 @vp5_adjust(i32 noundef 0, i32 noundef 0)
  ret i32 0
}

; Function Attrs: noinline nounwind optnone uwtable
define internal i32 @vp5_adjust(i32 noundef %v, i32 noundef %t) #0 {
entry:
  %v.addr = alloca i32, align 4
  %t.addr = alloca i32, align 4
  %a = alloca i32, align 4
  %r = alloca i32, align 4
  store i32 %v, ptr %v.addr, align 4
  store i32 %t, ptr %t.addr, align 4
  %0 = load i32, ptr %v.addr, align 4
  %cmp = icmp slt i32 %0, 0
  br i1 %cmp, label %cond.true, label %cond.false

cond.true:                                        ; preds = %entry
  %1 = load i32, ptr %v.addr, align 4
  %sub = sub nsw i32 0, %1
  br label %cond.end

cond.false:                                       ; preds = %entry
  %2 = load i32, ptr %v.addr, align 4
  br label %cond.end

cond.end:                                         ; preds = %cond.false, %cond.true
  %cond = phi i32 [ %sub, %cond.true ], [ %2, %cond.false ]
  store i32 %cond, ptr %a, align 4
  %3 = load i32, ptr %a, align 4
  %4 = load i32, ptr %t.addr, align 4
  %cmp1 = icmp slt i32 %3, %4
  br i1 %cmp1, label %if.then, label %if.else

if.then:                                          ; preds = %cond.end
  %5 = load i32, ptr %a, align 4
  store i32 %5, ptr %r, align 4
  br label %if.end13

if.else:                                          ; preds = %cond.end
  %6 = load i32, ptr %a, align 4
  %7 = load i32, ptr %t.addr, align 4
  %mul = mul nsw i32 2, %7
  %cmp2 = icmp slt i32 %6, %mul
  br i1 %cmp2, label %if.then3, label %if.else6

if.then3:                                         ; preds = %if.else
  %8 = load i32, ptr %t.addr, align 4
  %mul4 = mul nsw i32 2, %8
  %9 = load i32, ptr %a, align 4
  %sub5 = sub nsw i32 %mul4, %9
  store i32 %sub5, ptr %r, align 4
  br label %if.end

if.else6:                                         ; preds = %if.else
  %10 = load i32, ptr %t.addr, align 4
  %cmp7 = icmp slt i32 %10, 0
  br i1 %cmp7, label %cond.true8, label %cond.false10

cond.true8:                                       ; preds = %if.else6
  %11 = load i32, ptr %t.addr, align 4
  %mul9 = mul nsw i32 2, %11
  br label %cond.end11

cond.false10:                                     ; preds = %if.else6
  br label %cond.end11

cond.end11:                                       ; preds = %cond.false10, %cond.true8
  %cond12 = phi i32 [ %mul9, %cond.true8 ], [ 0, %cond.false10 ]
  store i32 %cond12, ptr %r, align 4
  br label %if.end

if.end:                                           ; preds = %cond.end11, %if.then3
  br label %if.end13

if.end13:                                         ; preds = %if.end, %if.then
  %12 = load i32, ptr %v.addr, align 4
  %cmp14 = icmp slt i32 %12, 0
  br i1 %cmp14, label %if.then15, label %if.end17

if.then15:                                        ; preds = %if.end13
  %13 = load i32, ptr %r, align 4
  %sub16 = sub nsw i32 0, %13
  store i32 %sub16, ptr %r, align 4
  br label %if.end17

if.end17:                                         ; preds = %if.then15, %if.end13
  %14 = load i32, ptr %r, align 4
  ret i32 %14
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
