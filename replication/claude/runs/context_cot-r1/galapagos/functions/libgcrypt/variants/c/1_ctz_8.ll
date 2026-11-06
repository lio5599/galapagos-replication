; ModuleID = '/home/liolsen/galapagos-replication/functions/libgcrypt/variants/c/1_ctz_8.bc'
source_filename = "/home/liolsen/galapagos-replication/functions/libgcrypt/variants/c/1_ctz_8.c"
target datalayout = "e-m:e-p270:32:32-p271:32:32-p272:64:64-i64:64-f80:128-n8:16:32:64-S128"
target triple = "x86_64-unknown-linux-gnu"

; Function Attrs: noinline nounwind optnone uwtable
define dso_local i32 @ctz(i64 noundef %in) #0 {
entry:
  %in.addr = alloca i64, align 8
  %x = alloca i64, align 8
  %r = alloca i32, align 4
  store i64 %in, ptr %in.addr, align 8
  %0 = load i64, ptr %in.addr, align 8
  %1 = load i64, ptr %in.addr, align 8
  %not = xor i64 %1, -1
  %add = add i64 %not, 1
  %and = and i64 %0, %add
  %sub = sub i64 %and, 1
  store i64 %sub, ptr %x, align 8
  store i32 0, ptr %r, align 4
  br label %while.cond

while.cond:                                       ; preds = %while.body, %entry
  %2 = load i64, ptr %x, align 8
  %tobool = icmp ne i64 %2, 0
  br i1 %tobool, label %while.body, label %while.end

while.body:                                       ; preds = %while.cond
  %3 = load i64, ptr %x, align 8
  %sub1 = sub i64 %3, 1
  %4 = load i64, ptr %x, align 8
  %and2 = and i64 %4, %sub1
  store i64 %and2, ptr %x, align 8
  %5 = load i32, ptr %r, align 4
  %inc = add nsw i32 %5, 1
  store i32 %inc, ptr %r, align 4
  br label %while.cond, !llvm.loop !6

while.end:                                        ; preds = %while.cond
  %6 = load i32, ptr %r, align 4
  ret i32 %6
}

; Function Attrs: noinline nounwind optnone uwtable
define dso_local i32 @main() #0 {
entry:
  %call = call i32 @ctz(i64 noundef 0)
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
!6 = distinct !{!6, !7}
!7 = !{!"llvm.loop.mustprogress"}
