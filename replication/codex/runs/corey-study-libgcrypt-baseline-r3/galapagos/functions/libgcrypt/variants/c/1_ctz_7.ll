; ModuleID = '/home/cbh/galapagos-corey-runs/corey-study-libgcrypt-baseline-r3/functions/libgcrypt/variants/c/1_ctz_7.bc'
source_filename = "/home/cbh/galapagos-corey-runs/corey-study-libgcrypt-baseline-r3/functions/libgcrypt/variants/c/1_ctz_7.c"
target datalayout = "e-m:e-p270:32:32-p271:32:32-p272:64:64-i64:64-f80:128-n8:16:32:64-S128"
target triple = "x86_64-unknown-linux-gnu"

@ctz.trailing = internal constant [16 x i8] c"\04\00\01\00\02\00\01\00\03\00\01\00\02\00\01\00", align 16

; Function Attrs: noinline nounwind optnone uwtable
define dso_local i32 @ctz(i64 noundef %in) #0 {
entry:
  %retval = alloca i32, align 4
  %in.addr = alloca i64, align 8
  %r = alloca i32, align 4
  %nibble = alloca i32, align 4
  store i64 %in, ptr %in.addr, align 8
  store i32 0, ptr %r, align 4
  br label %for.cond

for.cond:                                         ; preds = %for.inc, %entry
  %0 = load i32, ptr %r, align 4
  %cmp = icmp slt i32 %0, 64
  br i1 %cmp, label %for.body, label %for.end

for.body:                                         ; preds = %for.cond
  %1 = load i64, ptr %in.addr, align 8
  %and = and i64 %1, 15
  %conv = trunc i64 %and to i32
  store i32 %conv, ptr %nibble, align 4
  %2 = load i32, ptr %nibble, align 4
  %cmp1 = icmp ne i32 %2, 0
  br i1 %cmp1, label %if.then, label %if.end

if.then:                                          ; preds = %for.body
  %3 = load i32, ptr %r, align 4
  %4 = load i32, ptr %nibble, align 4
  %idxprom = zext i32 %4 to i64
  %arrayidx = getelementptr inbounds [16 x i8], ptr @ctz.trailing, i64 0, i64 %idxprom
  %5 = load i8, ptr %arrayidx, align 1
  %conv3 = zext i8 %5 to i32
  %add = add nsw i32 %3, %conv3
  store i32 %add, ptr %retval, align 4
  br label %return

if.end:                                           ; preds = %for.body
  %6 = load i64, ptr %in.addr, align 8
  %shr = lshr i64 %6, 4
  store i64 %shr, ptr %in.addr, align 8
  br label %for.inc

for.inc:                                          ; preds = %if.end
  %7 = load i32, ptr %r, align 4
  %add4 = add nsw i32 %7, 4
  store i32 %add4, ptr %r, align 4
  br label %for.cond, !llvm.loop !6

for.end:                                          ; preds = %for.cond
  store i32 64, ptr %retval, align 4
  br label %return

return:                                           ; preds = %for.end, %if.then
  %8 = load i32, ptr %retval, align 4
  ret i32 %8
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
