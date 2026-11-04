; ModuleID = '/home/liolsen/galapagos-replication/functions/ffmpeg/variants/c/2_vp5_adjust_6.bc'
source_filename = "/home/liolsen/galapagos-replication/functions/ffmpeg/variants/c/2_vp5_adjust_6.c"
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
  %at = alloca i32, align 4
  %d = alloca i32, align 4
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
  %3 = load i32, ptr %t.addr, align 4
  %cmp1 = icmp slt i32 %3, 0
  br i1 %cmp1, label %cond.true2, label %cond.false4

cond.true2:                                       ; preds = %cond.end
  %4 = load i32, ptr %t.addr, align 4
  %sub3 = sub nsw i32 0, %4
  br label %cond.end5

cond.false4:                                      ; preds = %cond.end
  %5 = load i32, ptr %t.addr, align 4
  br label %cond.end5

cond.end5:                                        ; preds = %cond.false4, %cond.true2
  %cond6 = phi i32 [ %sub3, %cond.true2 ], [ %5, %cond.false4 ]
  store i32 %cond6, ptr %at, align 4
  %6 = load i32, ptr %a, align 4
  %7 = load i32, ptr %t.addr, align 4
  %mul = mul nsw i32 2, %7
  %cmp7 = icmp slt i32 %6, %mul
  br i1 %cmp7, label %if.then, label %if.else

if.then:                                          ; preds = %cond.end5
  %8 = load i32, ptr %a, align 4
  %9 = load i32, ptr %t.addr, align 4
  %cmp8 = icmp sgt i32 %8, %9
  br i1 %cmp8, label %cond.true9, label %cond.false11

cond.true9:                                       ; preds = %if.then
  %10 = load i32, ptr %a, align 4
  %11 = load i32, ptr %t.addr, align 4
  %sub10 = sub nsw i32 %10, %11
  br label %cond.end13

cond.false11:                                     ; preds = %if.then
  %12 = load i32, ptr %t.addr, align 4
  %13 = load i32, ptr %a, align 4
  %sub12 = sub nsw i32 %12, %13
  br label %cond.end13

cond.end13:                                       ; preds = %cond.false11, %cond.true9
  %cond14 = phi i32 [ %sub10, %cond.true9 ], [ %sub12, %cond.false11 ]
  store i32 %cond14, ptr %d, align 4
  br label %if.end

if.else:                                          ; preds = %cond.end5
  %14 = load i32, ptr %at, align 4
  store i32 %14, ptr %d, align 4
  br label %if.end

if.end:                                           ; preds = %if.else, %cond.end13
  %15 = load i32, ptr %t.addr, align 4
  %16 = load i32, ptr %d, align 4
  %sub15 = sub nsw i32 %15, %16
  store i32 %sub15, ptr %r, align 4
  %17 = load i32, ptr %v.addr, align 4
  %cmp16 = icmp slt i32 %17, 0
  br i1 %cmp16, label %cond.true17, label %cond.false19

cond.true17:                                      ; preds = %if.end
  %18 = load i32, ptr %r, align 4
  %sub18 = sub nsw i32 0, %18
  br label %cond.end20

cond.false19:                                     ; preds = %if.end
  %19 = load i32, ptr %r, align 4
  br label %cond.end20

cond.end20:                                       ; preds = %cond.false19, %cond.true17
  %cond21 = phi i32 [ %sub18, %cond.true17 ], [ %19, %cond.false19 ]
  ret i32 %cond21
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
