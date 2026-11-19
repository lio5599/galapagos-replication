; ModuleID = '/home/cbh/galapagos-corey-runs/corey-study-libgcrypt-cot-r1/functions/libgcrypt/variants/c/0_barrett_reduce_6.bc'
source_filename = "/home/cbh/galapagos-corey-runs/corey-study-libgcrypt-cot-r1/functions/libgcrypt/variants/c/0_barrett_reduce_6.c"
target datalayout = "e-m:e-p270:32:32-p271:32:32-p272:64:64-i64:64-f80:128-n8:16:32:64-S128"
target triple = "x86_64-unknown-linux-gnu"

; Function Attrs: noinline nounwind optnone uwtable
define dso_local signext i16 @barrett_reduce(i16 noundef signext %a) #0 {
entry:
  %a.addr = alloca i16, align 2
  %x = alloca i32, align 4
  %r = alloca i32, align 4
  store i16 %a, ptr %a.addr, align 2
  %0 = load i16, ptr %a.addr, align 2
  %conv = sext i16 %0 to i32
  store i32 %conv, ptr %x, align 4
  %1 = load i32, ptr %x, align 4
  %cmp = icmp slt i32 %1, 0
  br i1 %cmp, label %cond.true, label %cond.false

cond.true:                                        ; preds = %entry
  %2 = load i32, ptr %x, align 4
  %sub = sub nsw i32 0, %2
  br label %cond.end

cond.false:                                       ; preds = %entry
  %3 = load i32, ptr %x, align 4
  br label %cond.end

cond.end:                                         ; preds = %cond.false, %cond.true
  %cond = phi i32 [ %sub, %cond.true ], [ %3, %cond.false ]
  store i32 %cond, ptr %r, align 4
  %4 = load i32, ptr %r, align 4
  %cmp2 = icmp sge i32 %4, 26632
  br i1 %cmp2, label %if.then, label %if.end

if.then:                                          ; preds = %cond.end
  %5 = load i32, ptr %r, align 4
  %sub4 = sub nsw i32 %5, 26632
  store i32 %sub4, ptr %r, align 4
  br label %if.end

if.end:                                           ; preds = %if.then, %cond.end
  %6 = load i32, ptr %r, align 4
  %cmp5 = icmp sge i32 %6, 13316
  br i1 %cmp5, label %if.then7, label %if.end9

if.then7:                                         ; preds = %if.end
  %7 = load i32, ptr %r, align 4
  %sub8 = sub nsw i32 %7, 13316
  store i32 %sub8, ptr %r, align 4
  br label %if.end9

if.end9:                                          ; preds = %if.then7, %if.end
  %8 = load i32, ptr %r, align 4
  %cmp10 = icmp sge i32 %8, 6658
  br i1 %cmp10, label %if.then12, label %if.end14

if.then12:                                        ; preds = %if.end9
  %9 = load i32, ptr %r, align 4
  %sub13 = sub nsw i32 %9, 6658
  store i32 %sub13, ptr %r, align 4
  br label %if.end14

if.end14:                                         ; preds = %if.then12, %if.end9
  %10 = load i32, ptr %r, align 4
  %cmp15 = icmp sge i32 %10, 3329
  br i1 %cmp15, label %if.then17, label %if.end19

if.then17:                                        ; preds = %if.end14
  %11 = load i32, ptr %r, align 4
  %sub18 = sub nsw i32 %11, 3329
  store i32 %sub18, ptr %r, align 4
  br label %if.end19

if.end19:                                         ; preds = %if.then17, %if.end14
  %12 = load i32, ptr %r, align 4
  %cmp20 = icmp sgt i32 %12, 1664
  br i1 %cmp20, label %if.then22, label %if.end24

if.then22:                                        ; preds = %if.end19
  %13 = load i32, ptr %r, align 4
  %sub23 = sub nsw i32 %13, 3329
  store i32 %sub23, ptr %r, align 4
  br label %if.end24

if.end24:                                         ; preds = %if.then22, %if.end19
  %14 = load i32, ptr %x, align 4
  %cmp25 = icmp slt i32 %14, 0
  br i1 %cmp25, label %cond.true27, label %cond.false29

cond.true27:                                      ; preds = %if.end24
  %15 = load i32, ptr %r, align 4
  %sub28 = sub nsw i32 0, %15
  br label %cond.end30

cond.false29:                                     ; preds = %if.end24
  %16 = load i32, ptr %r, align 4
  br label %cond.end30

cond.end30:                                       ; preds = %cond.false29, %cond.true27
  %cond31 = phi i32 [ %sub28, %cond.true27 ], [ %16, %cond.false29 ]
  %conv32 = trunc i32 %cond31 to i16
  ret i16 %conv32
}

; Function Attrs: noinline nounwind optnone uwtable
define dso_local i32 @main() #0 {
entry:
  %call = call signext i16 @barrett_reduce(i16 noundef signext 0)
  ret i32 0
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
