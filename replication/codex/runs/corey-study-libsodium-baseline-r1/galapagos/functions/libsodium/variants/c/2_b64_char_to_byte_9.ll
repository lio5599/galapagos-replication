; ModuleID = '/home/cbh/galapagos-corey-runs/corey-study-libsodium-baseline-r1/functions/libsodium/variants/c/2_b64_char_to_byte_9.bc'
source_filename = "/home/cbh/galapagos-corey-runs/corey-study-libsodium-baseline-r1/functions/libsodium/variants/c/2_b64_char_to_byte_9.c"
target datalayout = "e-m:e-p270:32:32-p271:32:32-p272:64:64-i64:64-f80:128-n8:16:32:64-S128"
target triple = "x86_64-unknown-linux-gnu"

@__const.b64_char_to_byte.starts = private unnamed_addr constant [3 x i32] [i32 65, i32 97, i32 48], align 4
@__const.b64_char_to_byte.ends = private unnamed_addr constant [3 x i32] [i32 90, i32 122, i32 57], align 4
@__const.b64_char_to_byte.offsets = private unnamed_addr constant [3 x i32] [i32 0, i32 26, i32 52], align 4
@__const.b64_char_to_byte.symbols = private unnamed_addr constant [2 x i32] [i32 43, i32 47], align 4
@__const.b64_char_to_byte.values = private unnamed_addr constant [2 x i32] [i32 62, i32 63], align 4

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
  %u = alloca i32, align 4
  %starts = alloca [3 x i32], align 4
  %ends = alloca [3 x i32], align 4
  %offsets = alloca [3 x i32], align 4
  %symbols = alloca [2 x i32], align 4
  %values = alloca [2 x i32], align 4
  %x = alloca i32, align 4
  %i = alloca i32, align 4
  %value = alloca i32, align 4
  %rejected = alloca i32, align 4
  %rejected12 = alloca i32, align 4
  store i32 %c, ptr %c.addr, align 4
  %0 = load i32, ptr %c.addr, align 4
  store i32 %0, ptr %u, align 4
  call void @llvm.memcpy.p0.p0.i64(ptr align 4 %starts, ptr align 4 @__const.b64_char_to_byte.starts, i64 12, i1 false)
  call void @llvm.memcpy.p0.p0.i64(ptr align 4 %ends, ptr align 4 @__const.b64_char_to_byte.ends, i64 12, i1 false)
  call void @llvm.memcpy.p0.p0.i64(ptr align 4 %offsets, ptr align 4 @__const.b64_char_to_byte.offsets, i64 12, i1 false)
  call void @llvm.memcpy.p0.p0.i64(ptr align 4 %symbols, ptr align 4 @__const.b64_char_to_byte.symbols, i64 8, i1 false)
  call void @llvm.memcpy.p0.p0.i64(ptr align 4 %values, ptr align 4 @__const.b64_char_to_byte.values, i64 8, i1 false)
  store i32 0, ptr %x, align 4
  store i32 3, ptr %i, align 4
  br label %while.cond

while.cond:                                       ; preds = %while.body, %entry
  %1 = load i32, ptr %i, align 4
  %cmp = icmp ne i32 %1, 0
  br i1 %cmp, label %while.body, label %while.end

while.body:                                       ; preds = %while.cond
  %2 = load i32, ptr %i, align 4
  %dec = add i32 %2, -1
  store i32 %dec, ptr %i, align 4
  %3 = load i32, ptr %u, align 4
  %4 = load i32, ptr %i, align 4
  %idxprom = zext i32 %4 to i64
  %arrayidx = getelementptr inbounds [3 x i32], ptr %starts, i64 0, i64 %idxprom
  %5 = load i32, ptr %arrayidx, align 4
  %sub = sub i32 %3, %5
  %6 = load i32, ptr %i, align 4
  %idxprom1 = zext i32 %6 to i64
  %arrayidx2 = getelementptr inbounds [3 x i32], ptr %offsets, i64 0, i64 %idxprom1
  %7 = load i32, ptr %arrayidx2, align 4
  %add = add i32 %sub, %7
  %and = and i32 %add, 255
  store i32 %and, ptr %value, align 4
  %8 = load i32, ptr %u, align 4
  %9 = load i32, ptr %i, align 4
  %idxprom3 = zext i32 %9 to i64
  %arrayidx4 = getelementptr inbounds [3 x i32], ptr %starts, i64 0, i64 %idxprom3
  %10 = load i32, ptr %arrayidx4, align 4
  %sub5 = sub i32 %8, %10
  %11 = load i32, ptr %i, align 4
  %idxprom6 = zext i32 %11 to i64
  %arrayidx7 = getelementptr inbounds [3 x i32], ptr %ends, i64 0, i64 %idxprom6
  %12 = load i32, ptr %arrayidx7, align 4
  %13 = load i32, ptr %u, align 4
  %sub8 = sub i32 %12, %13
  %or = or i32 %sub5, %sub8
  %shr = lshr i32 %or, 8
  store i32 %shr, ptr %rejected, align 4
  %14 = load i32, ptr %value, align 4
  %15 = load i32, ptr %value, align 4
  %16 = load i32, ptr %rejected, align 4
  %and9 = and i32 %15, %16
  %xor = xor i32 %14, %and9
  %17 = load i32, ptr %x, align 4
  %or10 = or i32 %17, %xor
  store i32 %or10, ptr %x, align 4
  br label %while.cond, !llvm.loop !6

while.end:                                        ; preds = %while.cond
  store i32 0, ptr %i, align 4
  br label %for.cond

for.cond:                                         ; preds = %for.inc, %while.end
  %18 = load i32, ptr %i, align 4
  %cmp11 = icmp ult i32 %18, 2
  br i1 %cmp11, label %for.body, label %for.end

for.body:                                         ; preds = %for.cond
  %19 = load i32, ptr %u, align 4
  %20 = load i32, ptr %i, align 4
  %idxprom13 = zext i32 %20 to i64
  %arrayidx14 = getelementptr inbounds [2 x i32], ptr %symbols, i64 0, i64 %idxprom13
  %21 = load i32, ptr %arrayidx14, align 4
  %xor15 = xor i32 %19, %21
  %sub16 = sub i32 0, %xor15
  %shr17 = lshr i32 %sub16, 8
  store i32 %shr17, ptr %rejected12, align 4
  %22 = load i32, ptr %i, align 4
  %idxprom18 = zext i32 %22 to i64
  %arrayidx19 = getelementptr inbounds [2 x i32], ptr %values, i64 0, i64 %idxprom18
  %23 = load i32, ptr %arrayidx19, align 4
  %24 = load i32, ptr %i, align 4
  %idxprom20 = zext i32 %24 to i64
  %arrayidx21 = getelementptr inbounds [2 x i32], ptr %values, i64 0, i64 %idxprom20
  %25 = load i32, ptr %arrayidx21, align 4
  %26 = load i32, ptr %rejected12, align 4
  %and22 = and i32 %25, %26
  %xor23 = xor i32 %23, %and22
  %27 = load i32, ptr %x, align 4
  %or24 = or i32 %27, %xor23
  store i32 %or24, ptr %x, align 4
  br label %for.inc

for.inc:                                          ; preds = %for.body
  %28 = load i32, ptr %i, align 4
  %inc = add i32 %28, 1
  store i32 %inc, ptr %i, align 4
  br label %for.cond, !llvm.loop !8

for.end:                                          ; preds = %for.cond
  %29 = load i32, ptr %x, align 4
  %cmp25 = icmp ne i32 %29, 0
  br i1 %cmp25, label %if.then, label %if.end

if.then:                                          ; preds = %for.end
  %30 = load i32, ptr %x, align 4
  store i32 %30, ptr %retval, align 4
  br label %return

if.end:                                           ; preds = %for.end
  %31 = load i32, ptr %u, align 4
  %xor26 = xor i32 %31, 65
  %sub27 = sub i32 0, %xor26
  %shr28 = lshr i32 %sub27, 8
  %and29 = and i32 %shr28, 255
  store i32 %and29, ptr %retval, align 4
  br label %return

return:                                           ; preds = %if.end, %if.then
  %32 = load i32, ptr %retval, align 4
  ret i32 %32
}

; Function Attrs: nocallback nofree nounwind willreturn memory(argmem: readwrite)
declare void @llvm.memcpy.p0.p0.i64(ptr noalias nocapture writeonly, ptr noalias nocapture readonly, i64, i1 immarg) #1

attributes #0 = { noinline nounwind optnone uwtable "frame-pointer"="all" "min-legal-vector-width"="0" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "tune-cpu"="generic" }
attributes #1 = { nocallback nofree nounwind willreturn memory(argmem: readwrite) }

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
!8 = distinct !{!8, !7}
