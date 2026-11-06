; ModuleID = '/home/liolsen/galapagos-replication/functions/libsodium/variants/c/2_b64_char_to_byte_7.bc'
source_filename = "/home/liolsen/galapagos-replication/functions/libsodium/variants/c/2_b64_char_to_byte_7.c"
target datalayout = "e-m:e-p270:32:32-p271:32:32-p272:64:64-i64:64-f80:128-n8:16:32:64-S128"
target triple = "x86_64-unknown-linux-gnu"

@b64_char_to_byte.first = internal constant [5 x i32] [i32 65, i32 97, i32 48, i32 43, i32 47], align 16
@b64_char_to_byte.len = internal constant [5 x i32] [i32 26, i32 26, i32 10, i32 1, i32 1], align 16
@b64_char_to_byte.base = internal constant [5 x i32] [i32 0, i32 26, i32 52, i32 62, i32 63], align 16

; Function Attrs: noinline nounwind optnone uwtable
define dso_local i32 @main() #0 {
entry:
  %call = call i32 @b64_char_to_byte(i32 noundef 0)
  ret i32 0
}

; Function Attrs: noinline nounwind optnone uwtable
define internal i32 @b64_char_to_byte(i32 noundef %c) #0 {
entry:
  %retval = alloca i32, align 4
  %c.addr = alloca i32, align 4
  %w = alloca i32, align 4
  %i = alloca i32, align 4
  store i32 %c, ptr %c.addr, align 4
  %0 = load i32, ptr %c.addr, align 4
  %and = and i32 %0, 65535
  store i32 %and, ptr %w, align 4
  store i32 0, ptr %i, align 4
  br label %for.cond

for.cond:                                         ; preds = %for.inc, %entry
  %1 = load i32, ptr %i, align 4
  %cmp = icmp ult i32 %1, 5
  br i1 %cmp, label %for.body, label %for.end

for.body:                                         ; preds = %for.cond
  %2 = load i32, ptr %w, align 4
  %3 = load i32, ptr %i, align 4
  %idxprom = zext i32 %3 to i64
  %arrayidx = getelementptr inbounds [5 x i32], ptr @b64_char_to_byte.first, i64 0, i64 %idxprom
  %4 = load i32, ptr %arrayidx, align 4
  %sub = sub i32 %2, %4
  %5 = load i32, ptr %i, align 4
  %idxprom1 = zext i32 %5 to i64
  %arrayidx2 = getelementptr inbounds [5 x i32], ptr @b64_char_to_byte.len, i64 0, i64 %idxprom1
  %6 = load i32, ptr %arrayidx2, align 4
  %cmp3 = icmp ult i32 %sub, %6
  br i1 %cmp3, label %if.then, label %if.end

if.then:                                          ; preds = %for.body
  %7 = load i32, ptr %i, align 4
  %idxprom4 = zext i32 %7 to i64
  %arrayidx5 = getelementptr inbounds [5 x i32], ptr @b64_char_to_byte.base, i64 0, i64 %idxprom4
  %8 = load i32, ptr %arrayidx5, align 4
  %9 = load i32, ptr %w, align 4
  %10 = load i32, ptr %i, align 4
  %idxprom6 = zext i32 %10 to i64
  %arrayidx7 = getelementptr inbounds [5 x i32], ptr @b64_char_to_byte.first, i64 0, i64 %idxprom6
  %11 = load i32, ptr %arrayidx7, align 4
  %sub8 = sub i32 %9, %11
  %add = add i32 %8, %sub8
  store i32 %add, ptr %retval, align 4
  br label %return

if.end:                                           ; preds = %for.body
  br label %for.inc

for.inc:                                          ; preds = %if.end
  %12 = load i32, ptr %i, align 4
  %inc = add i32 %12, 1
  store i32 %inc, ptr %i, align 4
  br label %for.cond, !llvm.loop !6

for.end:                                          ; preds = %for.cond
  %13 = load i32, ptr %w, align 4
  %shr = lshr i32 %13, 8
  %cmp9 = icmp eq i32 %shr, 255
  br i1 %cmp9, label %cond.true, label %cond.false

cond.true:                                        ; preds = %for.end
  %14 = load i32, ptr %w, align 4
  %cmp10 = icmp eq i32 %14, 65327
  %conv = zext i1 %cmp10 to i32
  %sub11 = sub i32 63, %conv
  br label %cond.end

cond.false:                                       ; preds = %for.end
  br label %cond.end

cond.end:                                         ; preds = %cond.false, %cond.true
  %cond = phi i32 [ %sub11, %cond.true ], [ 255, %cond.false ]
  store i32 %cond, ptr %retval, align 4
  br label %return

return:                                           ; preds = %cond.end, %if.then
  %15 = load i32, ptr %retval, align 4
  ret i32 %15
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
