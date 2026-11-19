; ModuleID = '/home/cbh/galapagos-corey-runs/corey-study-libgcrypt-cot-r2/functions/libgcrypt/variants/c/0_barrett_reduce_7.bc'
source_filename = "/home/cbh/galapagos-corey-runs/corey-study-libgcrypt-cot-r2/functions/libgcrypt/variants/c/0_barrett_reduce_7.c"
target datalayout = "e-m:e-p270:32:32-p271:32:32-p272:64:64-i64:64-f80:128-n8:16:32:64-S128"
target triple = "x86_64-unknown-linux-gnu"

; Function Attrs: noinline nounwind optnone uwtable
define dso_local signext i16 @barrett_reduce(i16 noundef signext %a) #0 {
entry:
  %a.addr = alloca i16, align 2
  %r = alloca i32, align 4
  store i16 %a, ptr %a.addr, align 2
  %0 = load i16, ptr %a.addr, align 2
  %conv = sext i16 %0 to i32
  %add = add nsw i32 %conv, 34954
  store i32 %add, ptr %r, align 4
  %1 = load i32, ptr %r, align 4
  %cmp = icmp sge i32 %1, 53264
  br i1 %cmp, label %if.then, label %if.end

if.then:                                          ; preds = %entry
  %2 = load i32, ptr %r, align 4
  %sub = sub nsw i32 %2, 53264
  store i32 %sub, ptr %r, align 4
  br label %if.end

if.end:                                           ; preds = %if.then, %entry
  %3 = load i32, ptr %r, align 4
  %cmp2 = icmp sge i32 %3, 26632
  br i1 %cmp2, label %if.then4, label %if.end6

if.then4:                                         ; preds = %if.end
  %4 = load i32, ptr %r, align 4
  %sub5 = sub nsw i32 %4, 26632
  store i32 %sub5, ptr %r, align 4
  br label %if.end6

if.end6:                                          ; preds = %if.then4, %if.end
  %5 = load i32, ptr %r, align 4
  %cmp7 = icmp sge i32 %5, 13316
  br i1 %cmp7, label %if.then9, label %if.end11

if.then9:                                         ; preds = %if.end6
  %6 = load i32, ptr %r, align 4
  %sub10 = sub nsw i32 %6, 13316
  store i32 %sub10, ptr %r, align 4
  br label %if.end11

if.end11:                                         ; preds = %if.then9, %if.end6
  %7 = load i32, ptr %r, align 4
  %cmp12 = icmp sge i32 %7, 6658
  br i1 %cmp12, label %if.then14, label %if.end16

if.then14:                                        ; preds = %if.end11
  %8 = load i32, ptr %r, align 4
  %sub15 = sub nsw i32 %8, 6658
  store i32 %sub15, ptr %r, align 4
  br label %if.end16

if.end16:                                         ; preds = %if.then14, %if.end11
  %9 = load i32, ptr %r, align 4
  %cmp17 = icmp sge i32 %9, 3329
  br i1 %cmp17, label %if.then19, label %if.end21

if.then19:                                        ; preds = %if.end16
  %10 = load i32, ptr %r, align 4
  %sub20 = sub nsw i32 %10, 3329
  store i32 %sub20, ptr %r, align 4
  br label %if.end21

if.end21:                                         ; preds = %if.then19, %if.end16
  %11 = load i32, ptr %r, align 4
  %sub22 = sub nsw i32 %11, 1664
  %conv23 = trunc i32 %sub22 to i16
  ret i16 %conv23
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
